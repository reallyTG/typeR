library(snpReady)


### Name: popgen
### Title: Population genetics from genomic data
### Aliases: popgen

### ** Examples

# hybrid maize data
data(maize.hyb)
x <- popgen(maize.hyb) 

# using subpopulations
PS<-c(rep(1,25), rep(2,25))
x <- popgen(maize.hyb, subgroups=PS)



