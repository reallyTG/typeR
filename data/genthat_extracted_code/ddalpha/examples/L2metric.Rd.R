library(ddalpha)


### Name: L2metric
### Title: Fast Computation of the L^2 Metric for Sets of Functional Data
### Aliases: L2metric
### Keywords: functional metric

### ** Examples

datapop = dataf2rawfd(dataf.population()$dataf,range=c(1950,2015),d=66)
A = datapop[1:20,]
B = datapop[21:50,]
L2metric(A,B)




