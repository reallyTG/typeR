library(frailtypack)


### Name: trivPenalNL
### Title: Fit a Non-Linear Trivariate Joint Model for Recurrent Events and
###   a Terminal Event with a Biomarker Described with an ODE Population
###   Model
### Aliases: trivPenalNL
### Keywords: models

### ** Examples



## Not run: 
##D 
##D ###--- Non-linear trivariate joint model for longitudinal data, ---###
##D ###--- recurrent events and a terminal event ---###
##D 
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D # No information on dose - creation of a dummy variable 
##D colorectalLongi$dose <- 1
##D 
##D 
##D # Parameters initialisation - estimation of a simplified model
##D # with two random effects (a frailty term and a random effect 
##D # related to biomarker growth (KG))
##D initial.model <- trivPenalNL(Surv(time0, time1, new.lesions) ~ cluster(id)
##D  + age + treatment + terminal(state), formula.terminalEvent =~ age + treatment, 
##D  biomarker = "tumor.size", formula.KG ~ 1, formula.KD ~ treatment, dose = "dose",
##D  time.biomarker = "year", data = colorectal, data.Longi =colorectalLongi, 
##D  random = "KG", id = "id", recurrentAG = TRUE, n.knots = 5, kappa = c(0.01, 2),
##D  method.GH = "Pseudo-adaptive")
##D 
##D 
##D # Trivariate joint model with initial values for parameters
##D # (computation takes around 40 minutes)
##D 
##D model <- trivPenalNL(Surv(time0, time1, new.lesions) ~ cluster(id) + age + treatment
##D  + terminal(state), formula.terminalEvent =~ age + treatment, biomarker = "tumor.size",
##D  formula.KG ~ 1, formula.KD ~ treatment, dose = "dose", time.biomarker = "year", 
##D  data = colorectal, data.Longi =colorectalLongi, random = c("y0", "KG"), id = "id", 
##D  init.B = c(-0.22, -0.16, -0.35, -0.19, 0.04, -0.41, 0.23), init.Alpha = 1.86,
##D  init.Eta = c(0.5, 0.57, 0.5, 2.34), init.Biomarker = c(1.24, 0.81, 1.07, -1.53),
##D  recurrentAG = TRUE, n.knots = 5, kappa = c(0.01, 2), method.GH = "Pseudo-adaptive")
##D 
## End(Not run)





