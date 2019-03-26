library(CorrBin)


### Name: pdf
### Title: Parametric distributions for correlated binary data
### Aliases: betabin.pdf pdf qpower.pdf
### Keywords: distribution

### ** Examples

#the distributions have quite different shapes
#with q-power assigning more weight to the "all affected" event than other distributions
plot(0:10, betabin.pdf(0.3, 0.4, 10), type="o", ylim=c(0,0.34),
  ylab="Density", xlab="Number of responses out of 10")
lines(0:10, qpower.pdf(0.3, 0.4, 10), type="o", col="red")



