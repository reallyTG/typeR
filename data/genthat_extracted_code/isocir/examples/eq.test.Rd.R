library(isocir)


### Name: eq.test
### Title: Test of Equality of Circular Orders
### Aliases: eq.test
### Keywords: circular isotonic CIRE test equality order aggregation

### ** Examples

data(cirgenes)
eq.test(cirgenes[-8,c(1:5)], popu=c(rep(1,5),rep(2,4)),
ws=c(1,2,3.5,2,1,8,4.2,1.35,6), method="TSP",control.method="alpha3",N=2)




