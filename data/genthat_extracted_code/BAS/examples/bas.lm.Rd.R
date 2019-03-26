library(BAS)


### Name: bas.lm
### Title: Bayesian Adaptive Sampling for Bayesian Model Averaging and
###   Variable Selection in Linear Models
### Aliases: bas.lm bas
### Keywords: regression

### ** Examples


library(MASS)
data(UScrime)
crime.bic <- bas.lm(log(y) ~ log(M) + So + log(Ed) +
  log(Po1) + log(Po2) +
  log(LF) + log(M.F) + log(Pop) + log(NW) +
  log(U1) + log(U2) + log(GDP) + log(Ineq) +
  log(Prob) + log(Time),
data = UScrime, n.models = 2^15, prior = "BIC",
modelprior = beta.binomial(1, 1),
initprobs = "eplogp", pivot = FALSE
)


# use MCMC rather than enumeration
crime.mcmc <- bas.lm(log(y) ~ log(M) + So + log(Ed) +
  log(Po1) + log(Po2) +
  log(LF) + log(M.F) + log(Pop) + log(NW) +
  log(U1) + log(U2) + log(GDP) + log(Ineq) +
  log(Prob) + log(Time),
data = UScrime,
method = "MCMC",
MCMC.iterations = 20000, prior = "BIC",
modelprior = beta.binomial(1, 1),
initprobs = "eplogp", pivot = FALSE
)

summary(crime.bic)
plot(crime.bic)
image(crime.bic, subset = -1)

# example with two-way interactions and hierarchical constraints
data(ToothGrowth)
ToothGrowth$dose <- factor(ToothGrowth$dose)
levels(ToothGrowth$dose) <- c("Low", "Medium", "High")
TG.bas <- bas.lm(len ~ supp * dose,
  data = ToothGrowth,
  modelprior = uniform(), method = "BAS",
  force.heredity = TRUE
)
summary(TG.bas)
image(TG.bas)

# exmple with non-full rank case

 loc <- system.file("testdata", package = "BAS")
 d <- read.csv(paste(loc, "JASP-testdata.csv", sep = "/"))
fullModelFormula <- as.formula("contNormal ~  contGamma * contExpon +
                                contGamma * contcor1 + contExpon * contcor1")

# should give warning; use pivot = T to fit non-full rank case (fails on i386)
 out = bas.lm(fullModelFormula,
              data = d,
              alpha = 0.125316,
              prior = "JZS",
              weights = facFifty, force.heredity = FALSE, pivot = FALSE)


# use pivot = TRUE to fit non-full rank case
out =  bas.lm(fullModelFormula,
              data = d,
              alpha = 0.125316,
              prior = "JZS",
              weights = facFifty, force.heredity = FALSE)

# more complete demo's
demo(BAS.hald)
## Not run: 
##D demo(BAS.USCrime)
## End(Not run)




