library(drc)


### Name: LL.3
### Title: The three-parameter log-logistic function
### Aliases: LL.3 LL.3u l3 l3u LL2.3 LL2.3u
### Keywords: models nonlinear

### ** Examples


## Fitting model with lower limit equal 0
ryegrass.model1 <- drm(rootl ~ conc, data = ryegrass, fct = LL.3())
summary(ryegrass.model1)

## Fitting binomial response
##  with non-zero control response

## Example dataset from Finney (1971) - example 19
logdose <- c(2.17, 2,1.68,1.08,-Inf,1.79,1.66,1.49,1.17,0.57)
n <- c(142,127,128,126,129,125,117,127,51,132)
r <- c(142,126,115,58,21,125,115,114,40,37)
treatment <- factor(c("w213","w213","w213","w213",
"w214","w214","w214","w214","w214","w214"))
# Note that the control is included in one of the two treatment groups
finney.ex19 <- data.frame(logdose, n, r, treatment)

## Fitting model where the lower limit is estimated
fe19.model1 <- drm(r/n~logdose, treatment, weights = n, data = finney.ex19, 
logDose = 10, fct = LL.3u(), type="binomial", 
pmodels = data.frame(treatment, 1, treatment))

summary(fe19.model1)
modelFit(fe19.model1)
plot(fe19.model1, ylim = c(0, 1.1), bp = -1, broken = TRUE, legendPos = c(0, 1))
abline(h = 1, lty = 2)




