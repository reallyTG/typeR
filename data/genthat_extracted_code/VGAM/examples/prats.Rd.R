library(VGAM)


### Name: prats
### Title: Pregnant Rats Toxological Experiment Data
### Aliases: prats
### Keywords: datasets

### ** Examples

prats
colSums(subset(prats, treatment == 0))
colSums(subset(prats, treatment == 1))
summary(prats)



