## ----setup, message = FALSE, warning = FALSE-----------------------------
library(rprev)
library(survival)
data(prevsim)

## ------------------------------------------------------------------------
summary(prevsim)

## ----basicsurvival, fig.height=4, fig.width=7, echo=F--------------------
survf <- survfit(Surv(time, status) ~ sex, data=prevsim)
survf_df <- data.frame(t=survf$time, s=survf$surv, sex=rep(c('M', 'F'), survf$strata))
ggplot2::ggplot(survf_df, ggplot2::aes(x=t, y=s, colour=sex)) +
    ggplot2::geom_line() +
    ggplot2::theme_bw() +
    ggplot2::labs(x='Time (days)', y='Survival probability') +
    ggplot2::ylim(0, 1)

## ------------------------------------------------------------------------
prevalence_total <- prevalence(index='2013-01-30', 
                               num_years_to_estimate=c(3, 5, 10, 20), 
                               data=prevsim, 
                               inc_formula = entrydate ~ sex,
                               surv_formula = Surv(time, status) ~ age + sex, 
                               dist='weibull', 
                               population_size = 1e6,
                               death_column = 'eventdate')

## ------------------------------------------------------------------------
prevalence_total

## ------------------------------------------------------------------------
summary(prevalence_total)

## ------------------------------------------------------------------------
prevalence_total$estimates

## ------------------------------------------------------------------------
head(prevalence_total$simulated)

## ------------------------------------------------------------------------
llog <- flexsurv::flexsurvreg(Surv(time, status) ~ age + sex, data=prevsim, dist='llogis')
llog

## ---- cache=T------------------------------------------------------------
prev_llog <- prevalence(index='2013-01-30', 
                        num_years_to_estimate=c(3, 5, 10, 20), 
                        data=prevsim, 
                        inc_formula = entrydate ~ sex,
                        surv_model=llog,
                        population_size = 1e6,
                        death_column = 'eventdate',
                        N_boot = 100)

## ---- cache=T------------------------------------------------------------
prev_llog

## ------------------------------------------------------------------------
fix_cure_mod <- fixed_cure(Surv(time, status) ~ age + sex, data=prevsim, cure_time=5*365.25, 
                           dist='weibull')

## ------------------------------------------------------------------------
prevalence(index='2013-01-30', 
           num_years_to_estimate=20, 
           data=prevsim, 
           inc_formula = entrydate ~ sex,
           surv_model=fix_cure_mod,        # Pass in the cure model that was built above
           population_size = 1e6,
           death_column = 'eventdate',
           N_boot = 30)

## ------------------------------------------------------------------------
prevalence_total

## ------------------------------------------------------------------------
mixture_cure <- flexsurvcure::flexsurvcure(Surv(time, status) ~ age + sex, data=prevsim, dist='weibull', link='logistic', mixture=TRUE)

## ------------------------------------------------------------------------
prevalence(index='2013-01-30', 
           num_years_to_estimate=20, 
           data=prevsim, 
           inc_formula = entrydate ~ sex,
           surv_model=mixture_cure,
           population_size = 1e6,
           death_column = 'eventdate',
           N_boot = 30)

## ---- eval=F-------------------------------------------------------------
#  build_my_survival_object <- function(formula, input_data) {
#      # Build a survival model using the specified formula and input data
#      model <- ...
#      object <- list(model=model,
#                     call=match.call())  # the function call must be included as an item 'call'
#      class(object) <- "myobj"
#      object
#  }

## ---- eval=F-------------------------------------------------------------
#  data <- data.frame(...)
#  myobj <- build_my_survival_object(Surv(time, status) ~ sex, data)
#  prevalence(...
#             surv_model=myobj, # This will work
#             ...)

## ---- eval=F-------------------------------------------------------------
#  some_data <- data.frame(...)
#  myobj <- build_my_survival_object(Surv(time, status) ~ sex, some_data)
#  prevalence(...
#             surv_model=myobj, # This WON'T work, since the data parameter was called 'some_data' instead
#             ...)

## ------------------------------------------------------------------------
build_poisson <- function(input_data) {
    rate <- nrow(input_data) / as.numeric(difftime(max(input_data$entrydate), min(input_data$eventdate)))
    # Build a survival model using the specified formula and input data
    object <- list(rate=rate,
                   call=match.call())  # the function call must be included as an item 'call'
    class(object) <- "pois"
    object
}

## ------------------------------------------------------------------------
data <- prevsim
pois_mod <- build_poisson(input_data=data)

## ------------------------------------------------------------------------
pois_mod

## ---- eval=F-------------------------------------------------------------
#  # object: The incidence model that will have been created on the bootstrapped data
#  # data: The data available to fit the model on, will be the registry data set provided to prevalence as this acts as the attribute prior distribution.
#  # timeframe: A single number specifying how long to generate incident cases for.
#  # covars: A character vector specifying the names of individual covariates that must be included in the returned data.table (or data frame)
#  
#  # Returns a data.table (or data frame but data.table is preferred) where each row represents an incident case with:
#  #   - The first column being the time since the origin, i.e. index date - N year prevalence
#  #   - Any subsequent columns holding covariates that must be provided as specified in the 'covars' argument
#  draw_incident_population <- function(object, data, timeframe, covars, ...)

## ------------------------------------------------------------------------
draw_incident_population.pois <- function(object, data, timeframe, covars, ...) {
    # Firstly draw inter-arrival times in the period [0, timeframe]. 
    # The expected number is simply timeframe * rate so we'll take this amount + a margin for error.
    expected <- 1.5 * (timeframe * object$rate)
    # Now draw inter-arrival times
    inter_arrival <- rexp(expected, object$rate)
    # Determine absolute incident times
    incident_times <- cumsum(inter_arrival)
    # Truncate to those within the timeframe
    incident_times <- incident_times[incident_times < timeframe]
    num_incident <- length(incident_times)
    
    # Sample individual attributes into a matrix. The required attributes are given by 'covars' argument
    attrs <- do.call('cbind', lapply(covars, function(x) sample(data[[x]], num_incident, replace=T)))
    
    # Now add the incident times as the first column
    attrs <- cbind(incident_times, attrs)
    
    # Convert to data frame and add column names
    attrs <- data.frame(attrs)
    colnames(attrs) <- c('incident_time', covars)
    
    # Return this data frame
    attrs
}

## ------------------------------------------------------------------------
inc_times <- validate_incidence_model(pois_mod, prevsim)

## ------------------------------------------------------------------------
head(inc_times)

## ------------------------------------------------------------------------
prevalence(index='2013-01-30', 
           num_years_to_estimate=c(3, 5, 10, 20), 
           data=prevsim, 
           inc_model = pois_mod,
           surv_formula = Surv(time, status) ~ age + sex, 
           dist='weibull', 
           population_size = 1e6,
           incident_column = 'entrydate',
           death_column = 'eventdate')

## ------------------------------------------------------------------------
library(flexsurv)
build_wei <- function(data) {
    mod <- flexsurvreg(Surv(time, status) ~ age, data=data, dist='weibull')
    obj <- list(coefs=coef(mod),
                call=match.call())
    class(obj) <- 'mysurv'
    obj
}

## ------------------------------------------------------------------------
survobj <- build_wei(data=data)
survobj

## ---- eval=F-------------------------------------------------------------
#  # object: The survival model
#  
#  # Returns a character vector detailing the covariates required to fit this model. All of
#  # these values should be columns in the data that is passed in the main 'prevalence' function.
#  extract_covars <- function(object)

## ------------------------------------------------------------------------
extract_covars.mysurv <- function(object) {
    "age"
}

## ---- eval=F-------------------------------------------------------------
#  # object: The survival object
#  # newdata: A data frame (or data.table) with the incident population stored with their
#  #   required covariates for the model.
#  # times: A vector of times to estimate survival probability at for individuals in
#  #   corresponding rows of 'newdata'. This should be the same length as there are
#  #   rows in 'newdata' since each individual has their survival probability estimated once.
#  
#  # Returns:
#  #  A vector of survival probabilities of length equal to the length of 'times' and the
#  #  number of rows in 'newdata'.
#  predict_survival_probability <- function(object, newdata, times)

## ------------------------------------------------------------------------
predict_survival_probability.mysurv <- function(object, newdata, times) {
    # Calculate linear predictor, this will form the shape parameter
    shape <- exp(object$coefs[1] + newdata$age*object$coefs[3])
    scale <- exp(object$coefs[2])
    1 - pweibull(times, shape, scale)
}

## ------------------------------------------------------------------------
predict_survival_probability(survobj, newdata=data.frame(age=c(50, 70)), times=c(100, 100))

## ------------------------------------------------------------------------
probs <- validate_survival_model(survobj, prevsim)
head(probs)

## ------------------------------------------------------------------------
prevalence(index='2013-01-30', 
           num_years_to_estimate=c(3, 5, 10, 20), 
           data=prevsim, 
           inc_formula = entrydate ~ 1,
           surv_model = survobj,
           population_size = 1e6,
           death_column = 'eventdate',
           N_boot = 100)

