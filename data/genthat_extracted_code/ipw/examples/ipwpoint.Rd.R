library(ipw)


### Name: ipwpoint
### Title: Estimate Inverse Probability Weights (Point Treatment)
### Aliases: ipwpoint
### Keywords: htest models

### ** Examples

#Simulate data with continuous confounder and outcome, binomial exposure.
#Marginal causal effect of exposure on outcome: 10.
n <- 1000
simdat <- data.frame(l = rnorm(n, 10, 5))
a.lin <- simdat$l - 10
pa <- exp(a.lin)/(1 + exp(a.lin))
simdat$a <- rbinom(n, 1, prob = pa)
simdat$y <- 10*simdat$a + 0.5*simdat$l + rnorm(n, -10, 5)
simdat[1:5,]

#Estimate ipw weights.
temp <- ipwpoint(
   exposure = a,
   family = "binomial",
   link = "logit",
   numerator = ~ 1,
   denominator = ~ l,
   data = simdat)
summary(temp$ipw.weights)

#Plot inverse probability weights
graphics.off()
ipwplot(weights = temp$ipw.weights, logscale = FALSE,
   main = "Stabilized weights", xlim = c(0, 8))

#Examine numerator and denominator models.
summary(temp$num.mod)
summary(temp$den.mod)

#Paste inverse probability weights
simdat$sw <- temp$ipw.weights

#Marginal structural model for the causal effect of a on y
#corrected for confounding by l using inverse probability weighting
#with robust standard error from the survey package.
require("survey")
msm <- (svyglm(y ~ a, design = svydesign(~ 1, weights = ~ sw,
   data = simdat)))
coef(msm)
confint(msm)


## Not run: 
##D #Compute basic bootstrap confidence interval .
##D require(boot)
##D boot.fun <- function(dat, index){
##D    coef(glm(
##D        formula = y ~ a,
##D        data = dat[index,],
##D        weights = ipwpoint(
##D            exposure = a,
##D            family = "gaussian",
##D            numerator = ~ 1,
##D            denominator = ~ l,
##D            data = dat[index,])$ipw.weights))[2]
##D    }
##D bootres <- boot(simdat, boot.fun, 499);bootres
##D boot.ci(bootres, type = "basic")
## End(Not run)




