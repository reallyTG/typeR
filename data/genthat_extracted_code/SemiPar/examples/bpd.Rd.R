library(SemiPar)


### Name: bpd
### Title: Bronchopulmonary dysplasia data
### Aliases: bpd
### Keywords: datasets

### ** Examples

library(SemiPar)
data(bpd)
attach(bpd)
plot(birthweight,BPD)
boxplot(split(birthweight,BPD),col="green")



