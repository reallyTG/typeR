library(merlin)


### Name: merlin
### Title: merlin - Mixed Effects Regression for Linear, Nonlinear and
###   User-defined models
### Aliases: merlin

### ** Examples

## No test: 
library(merlin)
data(pbc.merlin, package = "merlin")

# Linear fixed-effects model
merlin(logb ~ year,
       family = "gaussian",
       data = pbc.merlin)

# Linear mixed-effects model with random intercept and slope at ID level
merlin(logb ~ year + M1[id] * 1 + year:M2[id] * 1,
       family = "gaussian",
       levels = "id",
       data = pbc.merlin)

# Joint longitudinal and survival model with shared random effects
merlin(model = list(logb ~ year + M1[id] * 1,
                    Surv(stime, died) ~ trt + M1[id]),
       family = c("gaussian", "weibull"),
       levels = "id",
       data = pbc.merlin)

# Joint longitudinal and survival model with expected value
merlin(model = list(logb ~ year + M1[id] * 1,
                    Surv(stime, died) ~ trt + EV[logb]),
       family = c("gaussian", "weibull"),
       levels = "id",
       timevar = c("year","stime"),
       data = pbc.merlin)

# Gaussian distribution - implemented as a user-written family
logl_gaussian <- function(gml)
{
  y    <- merlin_util_depvar(gml)
  xzb  <- merlin_util_xzb(gml)
  se   <- exp(merlin_util_ap(gml,1))

  mu   <- (sweep(xzb,1,y,"-"))^2
  logl <- ((-0.5 * log(2*pi) - log(se)) - (mu/(2 * se^2)))
  return(logl)
}

merlin(logb ~ year + ap(1), family = "user", data = pbc.merlin,
                                  userf = "logl_gaussian")

# 3-level Weibull model
merlin(Surv(stime1,dead1) ~ age + M1[id1]*1 + M2[id2]*1,
       levels=c("id1","id2"), family="weibull", data=sim3)
## End(No test)



