library(qtlcharts)


### Name: iplotRF
### Title: Interactive plot of recombination fractions
### Aliases: iplotRF
### Keywords: hplot

### ** Examples

library(qtl)
data(fake.f2)
## Don't show: 
fake.f2 <- fake.f2[c(1,5,13),]
## End(Don't show)
fake.f2 <- est.rf(fake.f2)
## No test: 
iplotRF(fake.f2)
## End(No test)




