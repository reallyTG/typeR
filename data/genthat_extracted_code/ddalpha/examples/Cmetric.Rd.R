library(ddalpha)


### Name: Cmetric
### Title: Fast Computation of the Uniform Metric for Sets of Functional
###   Data
### Aliases: Cmetric
### Keywords: functional metric

### ** Examples

datapop = dataf2rawfd(dataf.population()$dataf,range=c(1950,2015),d=66)
A = datapop[1:20,]
B = datapop[21:50,]
Cmetric(A,B)




