library(psychotools)


### Name: gpcmodel
### Title: Generalized Partial Credit Model Fitting Function
### Aliases: gpcmodel print.gpcmodel summary.gpcmodel
###   print.summary.gpcmodel coef.gpcmodel bread.gpcmodel estfun.gpcmodel
###   logLik.gpcmodel vcov.gpcmodel
### Keywords: regression

### ** Examples

if(requireNamespace("mirt")) {

o <- options(digits = 4)

## mathematics 101 exam results
data("MathExam14W", package = "psychotools")

## generalized partial credit model
gpcm <- gpcmodel(y = MathExam14W$credit)
summary(gpcm)

## how to specify starting values as a vector of model parameters
st <- coef(gpcm)
gpcm <- gpcmodel(y = MathExam14W$credit, start = st)
## or a list containing a vector of slopes and a list of intercept vectors
## itemwise
set.seed(0)
st <- list(a = rlnorm(13, 0, 0.0625), d = replicate(13, rnorm(2, 0, 1), FALSE))
gpcm <- gpcmodel(y = MathExam14W$credit, start = st)

## visualizations
plot(gpcm, type = "profile")
plot(gpcm, type = "regions")
plot(gpcm, type = "piplot")
plot(gpcm, type = "curves", xlim = c(-6, 6))
plot(gpcm, type = "information", xlim = c(-6, 6))
## visualizing the IRT parametrization
plot(gpcm, type = "curves", xlim = c(-6, 6), items = 1)
abline(v = threshpar(gpcm)[[1]])
abline(v = itempar(gpcm)[1], lty = 2)

options(digits = o$digits)
}



