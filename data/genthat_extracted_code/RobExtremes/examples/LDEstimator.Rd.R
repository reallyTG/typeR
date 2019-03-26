library(RobExtremes)


### Name: LDEstimator
### Title: Function to compute LD (location-dispersion) estimates
### Aliases: LDEstimator medkMAD medkMADhybr medSn medQn
### Keywords: univar

### ** Examples

## (empirical) Data
set.seed(123)
x <- rgamma(50, scale = 0.5, shape = 3)

## parametric family of probability measures
G <- GammaFamily(scale = 1, shape = 2)

medQn(x = x, ParamFamily = G)
medSn(x = x, ParamFamily = G, q.lo = 0.5, q.up = 4)

## No test: 
## not tested on CRAN because it takes time...
## without speedup for Sn:
LDEstimator(x, loc.est = median, disp.est = Sn, loc.fctal = median,
            disp.fctal = getMethod("Sn","UnivariateDistribution"),
            ParamFamily = G, disp.est.ctrl = list(constant=1))

medkMAD(x = x, ParamFamily = G)
medkMADhybr(x = x, ParamFamily = G)
## End(No test)
medkMAD(x = x, k=10, ParamFamily = G)

##not at all robust:
LDEstimator(x, loc.est = mean, disp.est = sd,
               loc.fctal = E, disp.fctal = sd,
            ParamFamily = G)



