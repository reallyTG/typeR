library(archdata)


### Name: Bornholm
### Title: Female Iron Age Graves, Bornholm, Denmark
### Aliases: Bornholm
### Keywords: datasets

### ** Examples

data(Bornholm)
library(MASS)
Bornholm.ca <- corresp(Bornholm[, 4:42], nf=2)
plot(Bornholm.ca$rscore, pch=substring(Bornholm$Period, 1, 1), cex=.75)
boxplot(Bornholm.ca$rscore[, 1]~Bornholm$Period, main="First CA Axis by Period")



