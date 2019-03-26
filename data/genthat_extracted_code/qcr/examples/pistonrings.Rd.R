library(qcr)


### Name: pistonrings
### Title: Piston rings data
### Aliases: pistonrings
### Keywords: datasets

### ** Examples


data(pistonrings)
attach(pistonrings)
summary(pistonrings)
boxplot(diameter ~ sample)
plot(sample, diameter, cex=0.7)
lines(tapply(diameter,sample,mean))
detach(pistonrings)



