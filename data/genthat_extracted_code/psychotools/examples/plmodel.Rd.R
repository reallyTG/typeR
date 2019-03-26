library(psychotools)


### Name: plmodel
### Title: Parametric Logistic Model Fitting Function
### Aliases: plmodel print.plmodel summary.plmodel print.summary.plmodel
###   coef.plmodel confint.plmodel bread.plmodel estfun.plmodel
###   logLik.plmodel vcov.plmodel
### Keywords: regression

### ** Examples

if(requireNamespace("mirt")) {

o <- options(digits = 4)

## mathematics 101 exam results
data("MathExam14W", package = "psychotools")

## 2PL
twopl <- plmodel(y = MathExam14W$solved)
summary(twopl)

## how to specify starting values as a vector of model parameters
st <- coef(twopl)
twopl <- plmodel(y = MathExam14W$solved, start = st)
## or a list containing a vector of slopes and a vector of intercepts
set.seed(0)
st <- list(a = rlnorm(13, 0, 0.0625), d = rnorm(13, 0, 1))
twopl <- plmodel(y = MathExam14W$solved, start = st)

## visualizations
plot(twopl, type = "profile")
plot(twopl, type = "regions")
plot(twopl, type = "piplot")
plot(twopl, type = "curves", xlim = c(-6, 6))
plot(twopl, type = "information", xlim = c(-6, 6))
## visualizing the IRT parametrization
plot(twopl, type = "curves", xlim = c(-6, 6), items = 1)
abline(v = itempar(twopl)[1])
abline(h = 0.5, lty = 2)

## 2PL accounting for gender impact
table(MathExam14W$gender)
mtwopl <- plmodel(y = MathExam14W$solved, impact = MathExam14W$gender,
  grouppars = TRUE)
summary(mtwopl)
plot(mtwopl, type = "piplot")
## specifying starting values as a vector of model parameters, note that in
## this example impact is being modelled and therefore grouppars must be TRUE
## to get all model parameters
st <- coef(mtwopl)
mtwopl <- plmodel(y = MathExam14W$solved, impact = MathExam14W$gender,
  start = st)
## or a list containing a vector of slopes, a vector of intercepts and a vector
## of means and a vector of variances as the distributional group parameters
set.seed(1)
st <- list(a = rlnorm(13, 0, 0.0625), d = rnorm(13, 0, 1), m = 0, v = 1)
mtwopl <- plmodel(y = MathExam14W$solved, impact = MathExam14W$gender,
  start = st)

## MML estimated Rasch model (1PL)
rm <- plmodel(y = MathExam14W$solved, type = "1PL")
summary(rm)

options(digits = o$digits)
}



