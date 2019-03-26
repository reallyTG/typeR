library(JMbayes)


### Name: jointModelBayes
### Title: Joint Models for Longitudinal and Time-to-Event Data
### Aliases: jointModelBayes
### Keywords: multivariate regression

### ** Examples


## Not run: 
##D # A joint model for the AIDS dataset:
##D # First we fit the linear mixed model for the longitudinal measurements of
##D # sqrt CD4 cell counts
##D lmeFit.aids <- lme(CD4 ~ obstime * drug, random = ~ obstime | patient, data = aids)
##D # next we fit the Cox model for the time to death (including the 'x = TRUE' argument)
##D survFit.aids <- coxph(Surv(Time, death) ~ drug, data = aids.id, x = TRUE)
##D 
##D # the corresponding joint model is fitted by (the default is to assume 
##D # the current value parameterization)
##D jointFit.aids <- jointModelBayes(lmeFit.aids, survFit.aids, timeVar = "obstime")
##D summary(jointFit.aids)
##D 
##D # A joint model for the PBC dataset:
##D # We first fit the linear mixed and Cox models. In the first we include 
##D # splines to model flexibly the subject-specific longitudinal trajectories
##D lmeFit.pbc <- lme(log(serBilir) ~ ns(year, 2),
##D     random = list(id = pdDiag(form = ~ ns(year, 2))), data = pbc2)
##D survFit.pbc <- coxph(Surv(years, status2) ~ 1, data = pbc2.id, x = TRUE)
##D 
##D # the corresponding joint model is fitted by:
##D jointFit.pbc <- jointModelBayes(lmeFit.pbc, survFit.pbc, timeVar = "year", 
##D     baseHaz = "regression-splines")
##D summary(jointFit.pbc)
##D 
##D # we update the joint model fitted for the PBC dataset by including
##D # the time-dependent slopes term. To achieve this we need to define 
##D # the 'extraForm' argument, in which we use function dns() to numerically
##D # compute the derivative of the natural cubic spline. In addition, we increase
##D # the number of MCMC iterations to 35000
##D dform = list(fixed = ~ 0 + dns(year, 2), random = ~ 0 + dns(year, 2),
##D     indFixed = 2:3, indRandom = 2:3)
##D jointFit.pbc2 <- update(jointFit.pbc, param = "td-both", extraForm = dform,
##D     n.iter = 35000)
##D summary(jointFit.pbc2)
##D 
##D # we fit the same model with the shared random effects formulation
##D jointFit.pbc3 <- update(jointFit.pbc, param = "shared-betasRE")
##D summary(jointFit.pbc3)
##D 
##D # a joint model for left censored longitudinal data
##D # we create artificial left censoring in serum bilirubin
##D pbc2$CensInd <- as.numeric(pbc2$serBilir <= 0.8)
##D pbc2$serBilir2 <- pbc2$serBilir
##D pbc2$serBilir2[pbc2$CensInd == 1] <- 0.8
##D 
##D censdLong <- function (y, eta.y, scale, log = FALSE, data) {
##D     log.f <- dnorm(x = y, mean = eta.y, sd = scale, log = TRUE)
##D     log.F <- pnorm(q = y, mean = eta.y, sd = scale, log.p = TRUE)
##D     ind <- data$CensInd
##D     if (log) {
##D         (1 - ind) * log.f + ind * log.F
##D     } else {
##D         exp((1 - ind) * log.f + ind * log.F)
##D     }
##D }
##D lmeFit.pbc2 <- lme(log(serBilir2) ~ ns(year, 2), data = pbc2,
##D                    random = ~ ns(year, 2) | id, method = "ML")
##D jointFit.pbc4 <- jointModelBayes(lmeFit.pbc2, survFit.pbc, timeVar = "year",
##D                                   densLong = censdLong)
##D 
##D summary(jointFit.pbc4)
##D 
##D # a joint model for a binary outcome
##D pbc2$serBilirD <- 1 * (pbc2$serBilir > 1.8)
##D lmeFit.pbc3 <- glmmPQL(serBilirD ~ year, random = ~ year | id, 
##D 	family = binomial, data = pbc2)
##D 
##D dLongBin <- function (y, eta.y, scale, log = FALSE, data) {
##D     dbinom(x = y, size = 1, prob = plogis(eta.y), log = log)
##D }
##D 
##D jointFit.pbc5 <- jointModelBayes(lmeFit.pbc3, survFit.pbc, timeVar = "year", 
##D 	densLong = dLongBin)
##D 
##D summary(jointFit.pbc5)
##D 
##D 
##D # create start-stop counting process variables
##D pbc <- pbc2[c("id", "serBilir", "drug", "year", "years",
##D               "status2", "spiders")]
##D pbc$start <- pbc$year
##D splitID <- split(pbc[c("start", "years")], pbc$id)
##D pbc$stop <- unlist(lapply(splitID,
##D                           function (d) c(d$start[-1], d$years[1]) ))
##D pbc$event <- with(pbc, ave(status2, id,
##D                            FUN = function (x) c(rep(0, length(x)-1), x[1])))
##D pbc <- pbc[!is.na(pbc$spiders), ]
##D 
##D # left-truncation
##D pbc <- pbc[pbc$start != 0, ] 
##D 
##D lmeFit.pbc <- lme(log(serBilir) ~ drug * ns(year, 2),
##D                   random = ~ ns(year, 2) | id, data = pbc)
##D 
##D tdCox.pbc <- coxph(Surv(start, stop, event) ~ drug * spiders + cluster(id),
##D                    data = pbc, x = TRUE, model = TRUE)
##D 
##D jointFit.pbc6 <- jointModelBayes(lmeFit.pbc, tdCox.pbc, timeVar = "year")
##D 
##D summary(jointFit.pbc6)
## End(Not run)



