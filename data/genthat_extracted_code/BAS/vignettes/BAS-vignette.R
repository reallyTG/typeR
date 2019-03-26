## ----setup, include=FALSE------------------------------------------------
# require(knitr)
require(MASS)
require(dplyr)

## ----install, eval=FALSE-------------------------------------------------
#  install.packages("BAS")

## ----devtools, eval=FALSE------------------------------------------------
#  devtools::install_github("merliseclyde/BAS")

## ----data----------------------------------------------------------------
data(UScrime, package = "MASS")

## ----transform-----------------------------------------------------------
UScrime[, -2] <- log(UScrime[, -2])

## ----bas-----------------------------------------------------------------
library(BAS)
crime.ZS <- bas.lm(y ~ .,
  data = UScrime,
  prior = "ZS-null",
  modelprior = uniform(), initprobs = "eplogp",
  force.heredity = FALSE, pivot = TRUE
)

## ---- fig.show='hold'----------------------------------------------------
plot(crime.ZS, ask = F)

## ----pip, fig.width=5, fig.height=5--------------------------------------
plot(crime.ZS, which = 4, ask = FALSE, caption = "", sub.caption = "")

## ----print---------------------------------------------------------------
crime.ZS

## ----summary------------------------------------------------------------------
options(width = 80)
summary(crime.ZS)

## ----image, fig.width=5, fig.height=5-----------------------------------------
image(crime.ZS, rotate = F)

## ----coef---------------------------------------------------------------------
coef.ZS <- coef(crime.ZS)

## ----plot---------------------------------------------------------------------
plot(coef.ZS, subset = c(5:6), ask = F)

## ----coefall------------------------------------------------------------------

plot(coef.ZS, ask = FALSE)

## ----confint-coef-------------------------------------------------------------

confint(coef.ZS)

## ----plot-confint, fig.width=7------------------------------------------------
plot(confint(coef.ZS, parm = 2:16))

## ---- warning=FALSE,  fig.width=7---------------------------------------------
plot(confint(coef(crime.ZS, estimator = "HPM")))

## ---- warning=FALSE,  fig.width=7---------------------------------------------
plot(confint(coef(crime.ZS, estimator = "MPM")))

## ----choice of estimator------------------------------------------------------
muhat.BMA <- fitted(crime.ZS, estimator = "BMA")
BMA <- predict(crime.ZS, estimator = "BMA")

# predict has additional slots for fitted values under BMA, predictions under each model
names(BMA)

## ---- fig.width=5, fig.height=5-----------------------------------------------
par(mar = c(9, 9, 3, 3))
plot(muhat.BMA, BMA$fit,
  pch = 16,
  xlab = expression(hat(mu[i])), ylab = expression(hat(Y[i]))
)
abline(0, 1)

## ----HPM----------------------------------------------------------------------
HPM <- predict(crime.ZS, estimator = "HPM")

# show the indices of variables in the best model where 0 is the intercept
HPM$bestmodel

## -----------------------------------------------------------------------------
variable.names(HPM)

## ----MPM----------------------------------------------------------------------
MPM <- predict(crime.ZS, estimator = "MPM")
variable.names(MPM)

## ----BPM----------------------------------------------------------------------
BPM <- predict(crime.ZS, estimator = "BPM")
variable.names(BPM)

## ---- fig.width=6, fig.height=6-----------------------------------------------
GGally::ggpairs(data.frame(
  HPM = as.vector(HPM$fit), # this used predict so we need to extract fitted values
  MPM = as.vector(MPM$fit), # this used fitted
  BPM = as.vector(BPM$fit), # this used fitted
  BMA = as.vector(BMA$fit)
)) # this used predict

## ----se, fig.width=7----------------------------------------------------------
BPM <- predict(crime.ZS, estimator = "BPM", se.fit = TRUE)
crime.conf.fit <- confint(BPM, parm = "mean")
crime.conf.pred <- confint(BPM, parm = "pred")
plot(crime.conf.fit)
plot(crime.conf.pred)

## ----pred---------------------------------------------------------------------

new.pred <- predict(crime.ZS, newdata = UScrime, estimator = "MPM")

## -----------------------------------------------------------------------------
system.time(
  for (i in 1:10) {
    crime.ZS <- bas.lm(y ~ .,
      data = UScrime,
      prior = "ZS-null", method = "BAS",
      modelprior = uniform(), initprobs = "eplogp"
    )
  }
)

system.time(
  for (i in 1:10) {
    crime.ZS <- bas.lm(y ~ .,
      data = UScrime,
      prior = "ZS-null", method = "deterministic",
      modelprior = uniform(), initprobs = "eplogp"
    )
  }
)

## ----MCMC---------------------------------------------------------------------
crime.ZS <- bas.lm(y ~ .,
  data = UScrime,
  prior = "ZS-null",
  modelprior = uniform(),
  method = "MCMC"
)

## ----diagnostics--------------------------------------------------------------
diagnostics(crime.ZS, type = "pip", pch = 16)
diagnostics(crime.ZS, type = "model", pch = 16)

## ----biggerMCMC, eval=FALSE---------------------------------------------------
#  crime.ZS <- bas.lm(y ~ .,
#    data = UScrime,
#    prior = "ZS-null",
#    modelprior = uniform(),
#    method = "MCMC", MCMC.iterations = 10^6
#  )
#  
#  # Don't run diagnostics(crime.ZS, type="model", pch=16)

## ----add-out------------------------------------------------------------------
data("stackloss")
stackloss <- cbind(stackloss, diag(nrow(stackloss)))
stack.bas <- bas.lm(stack.loss ~ .,
  data = stackloss,
  method = "MCMC", initprobs = "marg-eplogp",
  prior = "ZS-null",
  modelprior = tr.poisson(4, 10),
  MCMC.iterations = 200000
)

## -----------------------------------------------------------------------------
knitr::kable(as.data.frame(summary(stack.bas)))

## -----------------------------------------------------------------------------
data(ToothGrowth)
ToothGrowth$dose <- factor(ToothGrowth$dose)
levels(ToothGrowth$dose) <- c("Low", "Medium", "High")

## -----------------------------------------------------------------------------
TG.bas <- bas.lm(len ~ supp + dose,
  data = ToothGrowth,
  modelprior = uniform(), method = "BAS"
)

image(TG.bas)

## -----------------------------------------------------------------------------
TG.bas <- bas.lm(len ~ supp + dose,
  data = ToothGrowth,
  modelprior = uniform(), method = "BAS", force.heredity = FALSE
)

image(TG.bas)

## -----------------------------------------------------------------------------
TG.bas <- bas.lm(len ~ supp * dose,
  data = ToothGrowth,
  modelprior = uniform(), method = "BAS", force.heredity = TRUE
)

image(TG.bas)

## ----force-herid--------------------------------------------------------------
TG.bas <- bas.lm(len ~ supp * dose,
  data = ToothGrowth,
  modelprior = uniform(), method = "BAS", force.heredity = FALSE
)
TG.herid.bas <- force.heredity.bas(TG.bas)

## ----climate------------------------------------------------------------------
climate <- read.table("https://stat.duke.edu/sites/stat.duke.edu/files/climate.dat", header = T)
str(climate)
summary(climate)

## ----read-climate-------------------------------------------------------------
library(dplyr)
climate <- filter(climate, proxy != 6) %>%
  mutate(proxy = factor(proxy))

## ----wtreg--------------------------------------------------------------------
climate.bas <- bas.lm(deltaT ~ proxy * poly(latitude, 2),
  data = climate,
  weights = 1 / sdev^2,
  prior = "hyper-g-n", alpha = 3.0,
  n.models = 2^20,
  modelprior = uniform()
)

## ----climate-image------------------------------------------------------------
image(climate.bas, rotate = F)

## ----wtreg-wo-contraint-------------------------------------------------------
# May take a while to enumerate all 2^20 models
climate.bas <- bas.lm(deltaT ~ proxy * poly(latitude, 2),
  data = climate,
  weights = 1 / sdev^2,
  prior = "hyper-g-n", alpha = 3.0,
  n.models = 2^20,
  modelprior = uniform(),
  force.heredity = FALSE
)
image(climate.bas)

