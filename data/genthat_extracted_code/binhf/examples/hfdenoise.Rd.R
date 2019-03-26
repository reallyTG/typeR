library(binhf)


### Name: hfdenoise
### Title: Simulation function
### Aliases: hfdenoise
### Keywords: regression

### ** Examples

sim<-hfdenoise()

plot(sim$x,sim$truep,type="l", xlab="",ylab="Binomial Proportion")

##^^ shows original proportion to estimate.

lines(sim$x,sim$fhat,col=2)
lines(sim$x,sim$fhata,col=3)

##^^shows the estimates of the proportion from the two transforms.




