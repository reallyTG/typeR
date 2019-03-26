library(anoint)


### Name: plot
### Title: Prognostic response plot (PR-plot) for 'anoint' class.
### Aliases: plot plot,anoint-method
### Keywords: methods

### ** Examples

set.seed(11903)

# BINOMIAL EVENT DATA WITH 4 NORMAL PROGNOSTIC FACTORS
pim.interaction <- data.anoint(
                             alpha = c(log(.2/.8),log(.2*.75/(1-.2*.75))),
                             beta = log(c(1.5,1.1,2,1.3)),
                             gamma = rep(1.5,4),
                             mean = rep(0,4),
                             vcov = diag(4),
                             type="binomial", n = 500
                             )

object <- anoint(y~(V1+V2+V3+V4)*trt,data=pim.interaction)

plot(object,bty="n",las=1)

# PLOT TREATMENT EFFECT ON LINEAR PREDICTOR SCALE
plot(object,fun=function(x)x,bty="n",las=1,ylab="treatment effect (linear predictor)")




