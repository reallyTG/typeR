library(intubate)


### Name: rms
### Title: Interfaces for rms package for data science pipelines.
### Aliases: ntbt_bj ntbt_cph ntbt_Glm ntbt_lrm ntbt_npsurv ntbt_ols
###   ntbt_orm ntbt_psm
### Keywords: intubate magrittr rms ntbt_bj ntbt_cph ntbt_Glm ntbt_lrm
###   ntbt_npsurv ntbt_ols ntbt_orm ntbt_psm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(rms)
##D 
##D ## ntbt_bj: Buckley-James Multiple Regression Model
##D set.seed(1)
##D ftime  <- 10*rexp(200)
##D stroke <- ifelse(ftime > 10, 0, 1)
##D ftime  <- pmin(ftime, 10)
##D units(ftime) <- "Month"
##D age <- rnorm(200, 70, 10)
##D hospital <- factor(sample(c('a','b'),200,TRUE))
##D dd <- datadist(age, hospital)
##D options(datadist = "dd")
##D data_bj <- data.frame(ftime, stroke, age, hospital)
##D 
##D ## Original function to interface
##D bj(Surv(ftime, stroke) ~ rcs(age,5) + hospital, data_bj, x = TRUE, y = TRUE)
##D 
##D ## The interface puts data as first parameter
##D f <- ntbt_bj(data_bj, Surv(ftime, stroke) ~ rcs(age,5) + hospital, x = TRUE, y = TRUE)
##D anova(f)
##D 
##D ## so it can be used easily in a pipeline.
##D data_bj %>%
##D   ntbt_bj(Surv(ftime, stroke) ~ rcs(age,5) + hospital, x = TRUE, y = TRUE)
##D 
##D 
##D ## ntbt_cph: Cox Proportional Hazards Model and Extensions
##D n <- 1000
##D set.seed(731)
##D age <- 50 + 12*rnorm(n)
##D label(age) <- "Age"
##D sex <- factor(sample(c('Male','Female'), n, 
##D               rep=TRUE, prob=c(.6, .4)))
##D cens <- 15*runif(n)
##D h <- .02*exp(.04*(age-50)+.8*(sex=='Female'))
##D dt <- -log(runif(n))/h
##D label(dt) <- 'Follow-up Time'
##D e <- ifelse(dt <= cens,1,0)
##D dt <- pmin(dt, cens)
##D units(dt) <- "Year"
##D dd <- datadist(age, sex)
##D options(datadist='dd')
##D S <- Surv(dt,e)
##D 
##D data_cph <- data.frame(S, age, sex)
##D 
##D ## Original function to interface
##D cph(S ~ rcs(age,4) + sex, data_cph, x = TRUE, y = TRUE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_cph(data_cph, S ~ rcs(age,4) + sex, x = TRUE, y = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D data_cph %>%
##D   ntbt_cph(S ~ rcs(age,4) + sex, x = TRUE, y = TRUE)
##D 
##D 
##D ## ntbt_Glm
##D ## Dobson (1990) Page 93: Randomized Controlled Trial :
##D counts <- c(18,17,15,20,10,20,25,13,12)
##D outcome <- gl(3,1,9)
##D treatment <- gl(3,3)
##D data_Glm <- data.frame(counts, outcome, treatment)
##D 
##D ## Original function to interface
##D Glm(counts ~ outcome + treatment, family = poisson(), data = data_Glm)
##D 
##D ## The interface puts data as first parameter
##D ntbt_Glm(data_Glm, counts ~ outcome + treatment, family = poisson())
##D 
##D ## so it can be used easily in a pipeline.
##D data_Glm %>%
##D   ntbt_Glm(counts ~ outcome + treatment, family = poisson())
##D 
##D 
##D ## ntbt_lrm: Logistic Regression Model
##D n <- 1000    # define sample size
##D set.seed(17) # so can reproduce the results
##D age            <- rnorm(n, 50, 10)
##D blood.pressure <- rnorm(n, 120, 15)
##D cholesterol    <- rnorm(n, 200, 25)
##D sex            <- factor(sample(c('female','male'), n,TRUE))
##D label(age)            <- 'Age'      # label is in Hmisc
##D label(cholesterol)    <- 'Total Cholesterol'
##D label(blood.pressure) <- 'Systolic Blood Pressure'
##D label(sex)            <- 'Sex'
##D units(cholesterol)    <- 'mg/dl'   # uses units.default in Hmisc
##D units(blood.pressure) <- 'mmHg'
##D 
##D #To use prop. odds model, avoid using a huge number of intercepts by
##D #grouping cholesterol into 40-tiles
##D ch <- cut2(cholesterol, g=40, levels.mean=TRUE) # use mean values in intervals
##D data_lrm <- data.frame(ch, age)
##D 
##D ## Original function to interface
##D lrm(ch ~ age, data_lrm)
##D 
##D ## The interface puts data as first parameter
##D ntbt_lrm(data_lrm, ch ~ age)
##D 
##D ## so it can be used easily in a pipeline.
##D data_lrm %>%
##D   ntbt_lrm(ch ~ age)
##D 
##D 
##D ## ntbt_npsurv: Nonparametric Survival Estimates for Censored Data
##D tdata <- data.frame(time   = c(1,1,1,2,2,2,3,3,3,4,4,4),
##D                     status = rep(c(1,0,2),4),
##D                     n      = c(12,3,2,6,2,4,2,0,2,3,3,5))
##D ## Original function to interface
##D f <- npsurv(Surv(time, time, status, type = 'interval') ~ 1, data = tdata, weights = n)
##D plot(f, fun = 'event', xmax = 20, mark.time = FALSE, col = 2:3)
##D 
##D ## The interface puts data as first parameter
##D f <- ntbt_npsurv(tdata, Surv(time, time, status, type = 'interval') ~ 1, weights = n)
##D plot(f, fun = 'event', xmax = 20, mark.time = FALSE, col = 2:3)
##D 
##D ## so it can be used easily in a pipeline.
##D tdata %>%
##D   ntbt_npsurv(Surv(time, time, status, type = 'interval') ~ 1, weights = n) %>%
##D   plot(fun = 'event', xmax = 20, mark.time = FALSE, col = 2:3)
##D 
##D 
##D ## ntbt_ols: Linear Model Estimation Using Ordinary Least Squares
##D set.seed(1)
##D x1 <- runif(200)
##D x2 <- sample(0:3, 200, TRUE)
##D distance <- (x1 + x2/3 + rnorm(200))^2
##D d <- datadist(x1, x2)
##D options(datadist="d")   # No d -> no summary, plot without giving all details
##D data_ols <- data.frame(distance, x1, x2)
##D 
##D ## Original function to interface
##D ols(sqrt(distance) ~ rcs(x1, 4) + scored(x2), data_ols, x = TRUE)
##D  
##D ## The interface puts data as first parameter
##D ntbt_ols(data_ols, sqrt(distance) ~ rcs(x1, 4) + scored(x2), x = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D data_ols %>%
##D   ntbt_ols(sqrt(distance) ~ rcs(x1, 4) + scored(x2), x = TRUE)
##D 
##D 
##D ## ntbt_orm: Ordinal Regression Model
##D set.seed(1)
##D n <- 300
##D x1 <- c(rep(0,150), rep(1,150))
##D y <- rnorm(n) + 3 * x1
##D data_orm <- data.frame(y, x1)
##D 
##D ## Original function to interface
##D orm(y ~ x1, data_orm)
##D 
##D ## The interface puts data as first parameter
##D ntbt_orm(data_orm, y ~ x1)
##D 
##D ## so it can be used easily in a pipeline.
##D data_orm %>%
##D   ntbt_orm(y ~ x1)
##D 
##D 
##D ## ntbt_psm: Parametric Survival Model
##D n <- 400
##D set.seed(1)
##D age <- rnorm(n, 50, 12)
##D sex <- factor(sample(c('Female','Male'),n,TRUE))
##D dd <- datadist(age,sex)
##D options(datadist='dd')
##D # Population hazard function:
##D h <- .02*exp(.06*(age-50)+.8*(sex=='Female'))
##D d.time <- -log(runif(n))/h
##D cens <- 15*runif(n)
##D death <- ifelse(d.time <= cens,1,0)
##D d.time <- pmin(d.time, cens)
##D 
##D data_psm <- data.frame(d.time, death, sex, age)
##D 
##D ## Original function to interface
##D psm(Surv(d.time, death) ~ sex * pol(age, 2), data_psm, dist = 'lognormal')
##D # Log-normal model is a bad fit for proportional hazards data
##D 
##D ## The interface puts data as first parameter
##D ntbt_psm(data_psm, Surv(d.time, death) ~ sex * pol(age, 2), dist = 'lognormal')
##D 
##D ## so it can be used easily in a pipeline.
##D data_psm %>%
##D   ntbt_psm(Surv(d.time, death) ~ sex * pol(age, 2), dist = 'lognormal')
## End(Not run)



