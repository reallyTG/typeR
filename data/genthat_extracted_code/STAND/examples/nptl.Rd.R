library(STAND)


### Name: nptl
### Title: Nonparametric Upper Tolerance Limit
### Aliases: nptl
### Keywords: nonparametric

### ** Examples

data(beTWA)
k<- nptl(length(beTWA[,1]))
rev(sort(beTWA[,1]))[k]



