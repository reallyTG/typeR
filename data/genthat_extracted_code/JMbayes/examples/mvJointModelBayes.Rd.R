library(JMbayes)


### Name: mvJointModelBayes
### Title: Multivariate Joint Models for Longitudinal and Time-to-Event
###   Data
### Aliases: mvJointModelBayes
### Keywords: multivariate regression

### ** Examples


## Not run: 
##D pbc2.id$Time <- pbc2.id$years
##D pbc2.id$event <- as.numeric(pbc2.id$status != "alive")
##D 
##D ##########################################################################################
##D 
##D ##############################################
##D # Univariate joint model for serum bilirubin #
##D ##############################################
##D 
##D # [1] Fit the mixed model using mvglmer(). The main arguments of this function are:
##D # 'formulas' a list of lme4-like formulas (a formular per outcome),
##D # 'data' a data.frame that contains all the variables specified in 'formulas' (NAs allowed),
##D # 'families' a list of family objects specifying the type of each outcome (currently only
##D # gaussian, binomial and poisson are allowed).
##D MixedModelFit1 <- mvglmer(list(log(serBilir) ~ year + (year | id)), data = pbc2,
##D                           families = list(gaussian))
##D 
##D # [2] Fit a Cox model, specifying the baseline covariates to be included in the joint
##D # model; you need to set argument 'model' to TRUE.
##D CoxFit1 <- coxph(Surv(Time, event) ~ drug + age, data = pbc2.id, model = TRUE)
##D 
##D # [3] The basic joint model is fitted using a call to mvJointModelBayes(), which is very
##D # similar to JointModelBayes(), i.e.,
##D JMFit1 <- mvJointModelBayes(MixedModelFit1, CoxFit1, timeVar = "year")
##D summary(JMFit1)
##D plot(JMFit1)
##D 
##D ##########################################################################################
##D 
##D #########################################################
##D # Bivariate joint model for serum bilirubin and spiders #
##D #########################################################
##D 
##D MixedModelFit2 <- mvglmer(list(log(serBilir) ~ year + (year | id),
##D                                spiders ~ year + (1 | id)), data = pbc2,
##D                           families = list(gaussian, binomial))
##D 
##D CoxFit2 <- coxph(Surv(Time, event) ~ drug + age, data = pbc2.id, model = TRUE)
##D 
##D JMFit2 <- mvJointModelBayes(MixedModelFit2, CoxFit2, timeVar = "year")
##D summary(JMFit2)
##D plot(JMFit2)
##D 
##D ##########################################################################################
##D 
##D #######################
##D # slopes & area terms #
##D #######################
##D 
##D # We extend model 'JMFit2' by including the value and slope term for bilirubin, and
##D # the area term for spiders (in the log-odds scale). To include these terms into the model
##D # we specify the 'Formulas' argument. This is specified in a similar manner as the
##D # 'derivForms' argument of jointModelBayes(). In particular, it should be a list of lists.
##D # Each component of the outer list should have as name the name of the corresponding
##D # outcome variable. Then in the inner list we need to specify four components, namely,
##D # 'fixed' & 'random' R formulas specifying the fixed and random effects part of the term
##D # to be included, and 'indFixed' & 'indRandom' integer indicices specifying which of the
##D # original fixed and random effects are involved in the claculation of the new term. In
##D # the inner list you can also optionally specify a name for the term you want to include.
##D # Notes: (1) For terms not specified in the 'Formulas' list, the default value functional
##D # form is used. (2) If for a particular outcome you want to include both the value
##D # functional form and an extra term, then you need to specify that in the 'Formulas'
##D # using two entries. To include the value functional form you only need to set the
##D # corresponding to 'value', and for the second term to specify the inner list. See
##D # example below on how to include the value and slope for serum bilirubin (for example,
##D # if the list below the entry '"log(serBilir)" = "value"' was not give, then only the
##D # slope term would have been included in the survival submodel).
##D 
##D Forms <- list("log(serBilir)" = "value",
##D               "log(serBilir)" = list(fixed = ~ 1, random = ~ 1,
##D                                      indFixed = 2, indRandom = 2, name = "slope"),
##D               "spiders" = list(fixed = ~ 0 + year + I(year^2/2), random = ~ 0 + year,
##D                                indFixed = 1:2, indRandom = 1, name = "area"))
##D 
##D JMFit3 <- update(JMFit2, Formulas = Forms)
##D summary(JMFit3)
##D plot(JMFit3)
##D 
##D ##########################################################################################
##D 
##D #####################
##D # Interaction terms #
##D #####################
##D 
##D # We further extend the previous model by including the interactions terms between the
##D # terms specified in 'Formulas' and 'drug'. The names specified in the list that defined
##D # the interaction factors should match with the names of the output from 'JMFit3'; the
##D # only exception is with regard to the 'value' functional form. See specification below
##D # (to include the interaction of the value term of 'log(serBilir)' with 'drug', in the
##D # list we can either specify as name of the corresponding formula 'log(serBilir)_value'
##D # or just 'log(serBilir)'):
##D 
##D Ints <- list("log(serBilir)" = ~ drug, "log(serBilir)_slope" = ~ drug,
##D              "spiders_area" = ~ drug)
##D 
##D # because of the many association parameters we have, we place a shrinkage prior on the
##D # alpha coefficients. In particular, if we have K association parameters, we assume that
##D # alpha_k ~ N(0, tau * phi_k), k = 1, ..., K. The precision parameters tau and phi_k are
##D # given Gamma priors. Precision tau is global shrinkage parameter, and phi_k a specific
##D # per alpha coefficient.
##D JMFit4 <- update(JMFit3, Interactions = Ints, priors = list(shrink_alphas = TRUE))
##D summary(JMFit4)
##D plot(JMFit4)
##D 
##D ##########################################################################################
##D 
##D ########################
##D # Time-varying effects #
##D ########################
##D 
##D # We allow the association parameter to vary with time; the time-varying coefficients are
##D # approximated with P-splines
##D JMFit_tveffect <- mvJointModelBayes(MixedModelFit1, CoxFit1, timeVar = "year",
##D                     Interactions = list("log(serBilir)_value" = ~ 0 + tve(Time, df = 8)))
##D 
##D plot(JMFit_tveffect, "tv_effect")
##D 
##D 
##D ##########################################################################################
##D 
##D ############################
##D # Interval censoring terms #
##D ############################
##D 
##D # create artificial interval censoring in the PBC data set
##D pbc2$status2 <- as.numeric(pbc2$status != "alive")
##D pbc2.id$status2 <- as.numeric(pbc2.id$status != "alive")
##D pbc2$status3 <- as.character(pbc2$status)
##D ff <- function (x) {
##D     out <- if (x[1L] %in% c('dead', 'transplanted')) 'dead' else 
##D         switch(sample(1:3, 1), '1' = "alive", '2' = "left", '3' = "interval")
##D     rep(out, length(x))
##D }
##D pbc2$status3 <- unlist(with(pbc2, lapply(split(status3, id), ff)), use.names = FALSE)
##D pbc2$status3 <- unname(with(pbc2, sapply(status3, function (x) 
##D     switch(x, 'dead' = 1, 'alive' = 0, 'left' = 2, 'interval' = 3))))
##D pbc2$yearsU <- as.numeric(NA)
##D pbc2$yearsU[pbc2$status3 == 3] <- pbc2$years[pbc2$status3 == 3] + 
##D     runif(sum(pbc2$status3 == 3), 0, 4)
##D pbc2.id <- pbc2[!duplicated(pbc2$id), ]
##D 
##D # next we fit a weibull model for interval censored data
##D survFit <- survreg(Surv(years, yearsU, status3, type = "interval") ~ drug + age, 
##D                    data = pbc2.id, model = TRUE)
##D 
##D # next we fit the joint model (we use 'MixedModelFit1' from above)
##D JMFit_intcens <- mvJointModelBayes(MixedModelFit1, survFit, timeVar = "year")
##D summary(JMFit_intcens)
## End(Not run)



