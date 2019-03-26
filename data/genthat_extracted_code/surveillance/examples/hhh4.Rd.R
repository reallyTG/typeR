library(surveillance)


### Name: hhh4
### Title: Fitting HHH Models with Random Effects and Neighbourhood
###   Structure
### Aliases: hhh4
### Keywords: ts regression

### ** Examples

######################
## Univariate examples
######################

### weekly counts of salmonella agona cases, UK, 1990-1995

data("salmonella.agona")
## convert old "disProg" to new "sts" data class
salmonella <- disProg2sts(salmonella.agona)
salmonella
plot(salmonella)

## generate formula for an (endemic) time trend and seasonality
f.end <- addSeason2formula(f = ~1 + t, S = 1, period = 52)
f.end
## specify a simple autoregressive negative binomial model
model1 <- list(ar = list(f = ~1), end = list(f = f.end), family = "NegBin1")
## fit this model to the data
res <- hhh4(salmonella, model1)
## summarize the model fit
summary(res, idx2Exp=1, amplitudeShift=TRUE, maxEV=TRUE)
plot(res)
plot(res, type = "season", components = "end")


### weekly counts of meningococcal infections, Germany, 2001-2006

data("influMen")
fluMen <- disProg2sts(influMen)
meningo <- fluMen[, "meningococcus"]
meningo
plot(meningo)

## again a simple autoregressive NegBin model with endemic seasonality
meningoFit <- hhh4(stsObj = meningo, control = list(
    ar = list(f = ~1),
    end = list(f = addSeason2formula(f = ~1, S = 1, period = 52)),
    family = "NegBin1"
))

summary(meningoFit, idx2Exp=TRUE, amplitudeShift=TRUE, maxEV=TRUE)
plot(meningoFit)
plot(meningoFit, type = "season", components = "end")


########################
## Multivariate examples
########################

### bivariate analysis of influenza and meningococcal infections
### (see Paul et al, 2008)

plot(fluMen, same.scale = FALSE)
     
## Fit a negative binomial model with
## - autoregressive component: disease-specific intercepts
## - neighbour-driven component: only transmission from flu to men
## - endemic component: S=3 and S=1 sine/cosine pairs for flu and men, respectively
## - disease-specific overdispersion

WfluMen <- neighbourhood(fluMen)
WfluMen["meningococcus","influenza"] <- 0
WfluMen
f.end_fluMen <- addSeason2formula(f = ~ -1 + fe(1, which = c(TRUE, TRUE)),
                                  S = c(3, 1), period = 52)
f.end_fluMen
fluMenFit <- hhh4(fluMen, control = list(
    ar = list(f = ~ -1 + fe(1, unitSpecific = TRUE)),
    ne = list(f = ~ 1, weights = WfluMen),
    end = list(f = f.end_fluMen),
    family = "NegBinM"))
summary(fluMenFit, idx2Exp=1:3)
plot(fluMenFit, type = "season", components = "end", unit = 1)
plot(fluMenFit, type = "season", components = "end", unit = 2)


### weekly counts of measles, Weser-Ems region of Lower Saxony, Germany

data("measlesWeserEms")
measlesWeserEms
plot(measlesWeserEms)  # note the two districts with zero cases

## we could fit the same simple model as for the salmonella cases above
model1 <- list(
    ar = list(f = ~1),
    end = list(f = addSeason2formula(~1 + t, period = 52)),
    family = "NegBin1"
)
measlesFit <- hhh4(measlesWeserEms, model1)
summary(measlesFit, idx2Exp=TRUE, amplitudeShift=TRUE, maxEV=TRUE)

## but we should probably at least use a population offset in the endemic
## component to reflect heterogeneous incidence levels of the districts,
## and account for spatial dependence (here just using first-order adjacency)
measlesFit2 <- update(measlesFit,
    end = list(offset = population(measlesWeserEms)),
    ne = list(f = ~1, weights = neighbourhood(measlesWeserEms) == 1))
summary(measlesFit2, idx2Exp=TRUE, amplitudeShift=TRUE, maxEV=TRUE)
plot(measlesFit2, units = NULL, hide0s = TRUE)

## 'measlesFit2' corresponds to the 'measlesFit_basic' model in
## vignette("hhh4_spacetime"). See there for further analyses,
## including vaccination coverage as a covariate,
## spatial power-law weights, and random intercepts.


## Not run: 
##D ### last but not least, a more sophisticated (and time-consuming)
##D ### analysis of weekly counts of influenza from 140 districts in
##D ### Southern Germany (originally analysed by Paul and Held, 2011,
##D ### and revisited by Held and Paul, 2012, and Meyer and Held, 2014)
##D 
##D data("fluBYBW")
##D plot(fluBYBW, type = observed ~ time)
##D plot(fluBYBW, type = observed ~ unit,
##D      ## mean yearly incidence per 100.000 inhabitants (8 years)
##D      population = fluBYBW@map$X31_12_01 / 100000 * 8)
##D 
##D ## For the full set of models for data("fluBYBW") as analysed by
##D ## Paul and Held (2011), including predictive model assessement
##D ## using proper scoring rules, see the (computer-intensive)
##D ## demo("fluBYBW") script:
##D demoscript <- system.file(file.path("demo", "fluBYBW.R"),
##D                           package = "surveillance")
##D demoscript
##D #file.show(demoscript)
##D 
##D ## Here we fit the improved power-law model of Meyer and Held (2014)
##D ## - autoregressive component: random intercepts + S = 1 sine/cosine pair
##D ## - neighbour-driven component: random intercepts + S = 1 sine/cosine pair
##D ##   + population gravity with normalized power-law weights
##D ## - endemic component: random intercepts + trend + S = 3 sine/cosine pairs
##D ## - random intercepts are iid but correlated between components
##D f.S1 <- addSeason2formula(
##D     ~-1 + ri(type="iid", corr="all"),
##D     S = 1, period = 52)
##D f.end.S3 <- addSeason2formula(
##D     ~-1 + ri(type="iid", corr="all") + I((t-208)/100),
##D     S = 3, period = 52)
##D 
##D ## for power-law weights, we need adjaceny orders, which can be
##D ## computed from the binary adjacency indicator matrix
##D nbOrder1 <- neighbourhood(fluBYBW)
##D neighbourhood(fluBYBW) <- nbOrder(nbOrder1, 15)
##D 
##D ## full model specification
##D fluModel <- list(
##D     ar = list(f = f.S1),
##D     ne = list(f = update.formula(f.S1, ~ . + log(pop)),
##D               weights = W_powerlaw(maxlag=max(neighbourhood(fluBYBW)),
##D                                    normalize = TRUE, log = TRUE)),
##D     end = list(f = f.end.S3, offset = population(fluBYBW)),
##D     family = "NegBin1", data = list(pop = population(fluBYBW)),
##D     optimizer = list(variance = list(method = "Nelder-Mead")),
##D     verbose = TRUE)
##D 
##D ## CAVE: random effects considerably increase the runtime of model estimation
##D ## (It is usually advantageous to first fit a model with simple intercepts
##D ## to obtain reasonable start values for the other parameters.)
##D set.seed(1)  # because random intercepts are initialized randomly
##D fluFit <- hhh4(fluBYBW, fluModel)
##D 
##D summary(fluFit, idx2Exp=TRUE, amplitudeShift=TRUE)
##D 
##D plot(fluFit, type = "season")
##D 
##D plot(fluFit, type = "neweights", xlab = "adjacency order")
##D 
##D gridExtra::grid.arrange(
##D     grobs = lapply(c("ar", "ne", "end"), function (comp)
##D         plot(fluFit, type = "ri", component = comp, main = comp,
##D              at = seq(-2.6, 2.6, length.out = 15),
##D              col.regions = cm.colors(14))),
##D     nrow = 1, ncol = 3)
##D 
##D range(plot(fluFit, type = "maxEV"))
## End(Not run)


########################################################################
## An endemic-only "hhh4" model can also be estimated using MASS::glm.nb
########################################################################

## weekly counts of measles, Weser-Ems region of Lower Saxony, Germany
data("measlesWeserEms")

## fit an endemic-only "hhh4" model
## with time covariates and a district-specific offset
hhh4fit <- hhh4(measlesWeserEms, control = list(
    end = list(f = addSeason2formula(~1 + t, period = measlesWeserEms@freq),
               offset = population(measlesWeserEms)),
    ar = list(f = ~-1), ne = list(f = ~-1), family = "NegBin1",
    subset = 1:nrow(measlesWeserEms)
))
summary(hhh4fit)

## fit the same model using MASS::glm.nb
measlesWeserEmsData <- as.data.frame(measlesWeserEms, tidy = TRUE)
measlesWeserEmsData$t <- c(hhh4fit$control$data$t)
glmnbfit <- MASS::glm.nb(
    update(formula(hhh4fit)$end, observed ~ . + offset(log(population))),
    data = measlesWeserEmsData
)
summary(glmnbfit)

## Note that the overdispersion parameter is parametrized inversely.
## The likelihood and point estimates are all the same.
## However, the variance estimates are different: in glm.nb, the parameters
## are estimated conditional on the overdispersion theta.

## Don't show: 
stopifnot(
    all.equal(logLik(hhh4fit), logLik(glmnbfit)),
    all.equal(1/coef(hhh4fit)[["overdisp"]], glmnbfit$theta, tolerance = 1e-6),
    all.equal(coef(hhh4fit)[1:4], coef(glmnbfit),
              tolerance = 1e-6, check.attributes = FALSE),
    all.equal(c(residuals(hhh4fit)), residuals(glmnbfit),
              tolerance = 1e-6, check.attributes = FALSE)
)
## End(Don't show)



