library(lcc)


### Name: lcc
### Title: Longitudinal Concordance Correlation (LCC) estimated by fixed
###   effects and variance components of polynomial mixed-effects
###   regression model
### Aliases: lcc
### Keywords: ggplot2 nlme

### ** Examples

data(hue)
## Second degree polynomial model with random intercept, slope and
## quadratic term
fm1<-lcc(dataset = hue, subject = "Fruit", resp = "H_mean",
         method = "Method", time = "Time", qf = 2, qr = 2)
summary(fm1)
summary(fm1, type="model")
lccPlot(fm1)

## Estimating longitudinal Pearson correlation and longitudinal accuracy
fm2<-lcc(dataset = hue, subject = "Fruit", resp = "H_mean",
         method = "Method", time = "Time", qf = 2, qr = 2,
         components = TRUE)
summary(fm2)
lccPlot(fm2)

## A grid of points as the Time variable for prediction
fm3<-lcc(dataset = hue, subject = "Fruit", resp = "H_mean",
         method = "Method", time = "Time", qf = 2, qr = 2,
         components = TRUE, time_lcc = list(from = min(hue$Time),
         to = max(hue$Time), n=40))
summary(fm3)
lccPlot(fm3)

## Including an exponential variance function using time as a covariate.
fm4<-lcc(dataset = hue, subject = "Fruit", resp = "H_mean",
         method = "Method", time = "Time", qf = 2, qr = 2,
         components = TRUE, time_lcc = list(from = min(hue$Time),
         to = max(hue$Time), n=40), var.class=varExp,
         weights.form="time")
summary(fm4)
lccPlot(fm4)

## Not run: 
##D ## Non-parametric confidence interval with 500 bootstrap samples
##D fm5<-lcc(dataset = hue, subject = "Fruit", resp = "H_mean",
##D          method = "Method", time = "Time", qf = 2, qr = 2,
##D          ci = TRUE, nboot = 500)
##D summary(fm5)
##D lccPlot(fm5)
## End(Not run)

## Considering three methods of color evaluation
## Not run: 
##D data(simulated_hue)
##D attach(simulated_hue)    
##D fm6<-lcc(dataset = simulated_hue, subject = "Fruit",
##D          resp = "Hue", method = "Method", time = "Time", 
##D          qf = 2, qr = 1, components = TRUE, 
##D          time_lcc = list(n=50, from=min(Time), to=max(Time)))
##D summary(fm6)
##D lccPlot(fm6)
##D detach(simulated_hue)
## End(Not run)

## Including an additional covariate in the linear predictor
## (randomized block design)  
## Not run: 
##D data(simulated_hue_block)
##D attach(simulated_hue_block)
##D fm7<-lcc(dataset = simulated_hue_block, subject = "Fruit",
##D          resp = "Hue", method = "Method",time = "Time", 
##D          qf = 2, qr = 1, components = TRUE, covar = c("Block"),
##D          time_lcc = list(n=50, from=min(Time), to=max(Time)))
##D summary(fm7) 
##D lccPlot(fm7)
##D detach(simulated_hue_block)
## End(Not run)




