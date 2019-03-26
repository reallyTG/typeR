library(locfit)


### Name: aicplot
### Title: Compute an AIC plot.
### Aliases: aicplot
### Keywords: htest

### ** Examples

data(morths)
plot(aicplot(deaths~age,weights=n,data=morths,family="binomial",
  alpha=seq(0.2,1.0,by=0.05)))



