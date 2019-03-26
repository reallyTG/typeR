library(DoseFinding)


### Name: bFitMod
### Title: Fit a dose-response model using Bayesian or bootstrap methods.
### Aliases: bFitMod coef.bFitMod predict.bFitMod plot.bFitMod

### ** Examples

  data(biom)
  ## produce first stage fit (using dose as factor)
  anMod <- lm(resp~factor(dose)-1, data=biom)
  drFit <- coef(anMod)
  S <- vcov(anMod)
  dose <- sort(unique(biom$dose))
  ## define prior list
  ## normal prior for E0 (mean=0 and sdev=10)
  ## normal prior for Emax (mean=0 and sdev=100)
  ## beta prior for ED50: bounds: [0,1.5] parameters shape1=0.45, shape2=1.7
  prior <- list(norm = c(0, 10), norm = c(0,100), beta=c(0,1.5,0.45,1.7))
  ## now fit an emax model
  gsample <- bFitMod(dose, drFit, S, model = "emax", 
                      start = c(0, 1, 0.1), nSim = 1000, prior = prior)
  ## summary information
  gsample
  ## samples are stored in
  head(gsample$samples)
  ## predict 0.025, 0.25, 0.5, 0.75, 0.975 Quantile at 0, 0.5 and 1
  predict(gsample, doseSeq = c(0, 0.5, 1))
  ## simple plot function
  plot(gsample)

  ## now look at bootstrap distribution
  gsample <- bFitMod(dose, drFit, S, model = "emax", type = "bootstrap",
                     nSim = 100, bnds = defBnds(1)$emax)
  plot(gsample)

  ## now fit linear interpolation
  prior <- list(norm = c(0,1000), norm = c(0,1000),
                norm = c(0,1000), norm = c(0,1000), norm = c(0,100))
  gsample <- bFitMod(dose, drFit, S, model = "linInt", 
                     start = rep(1,5), nSim = 1000, prior = prior)
  gsample <- bFitMod(dose, drFit, S, model = "linInt", type = "bootstrap",
                     nSim = 100)

  ## data fitted on placebo adjusted scale
  data(IBScovars)
  anovaMod <- lm(resp~factor(dose)+gender, data=IBScovars)
  drFit <- coef(anovaMod)[2:5] # placebo adjusted estimates at doses
  vCov <- vcov(anovaMod)[2:5,2:5]
  dose <- sort(unique(IBScovars$dose))[-1]
  prior <- list(norm = c(0,100), beta=c(0,6,0.45,1.7))
  ## Bayes fit
  gsample <- bFitMod(dose, drFit, vCov, model = "emax", placAdj=TRUE,
                     start = c(1, 0.1), nSim = 1000, prior = prior)
  ## bootstrap fit
  gsample <- bFitMod(dose, drFit, vCov, model = "emax", placAdj=TRUE,
                     type = "bootstrap", start = c(1, 0.1),
                     nSim = 100, prior = prior, bnds = c(0.01,6))
  ## calculate target dose estimate
  TD(gsample, Delta = 0.2)
  ## now fit linear interpolation
  prior <- list(norm = c(0,1000), norm = c(0,1000), norm = c(0,1000), norm = c(0,100))
  gsample <- bFitMod(dose, drFit, vCov, model = "linInt", placAdj=TRUE,
                     start = rep(1,4), nSim = 1000, prior = prior)
  gsample <- bFitMod(dose, drFit, vCov, model = "linInt", type = "bootstrap",
                     placAdj = TRUE, nSim = 100)



