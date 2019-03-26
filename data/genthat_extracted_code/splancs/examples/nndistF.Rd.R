library(splancs)


### Name: nndistF
### Title: Nearest neighbour distances as used by Fhat()
### Aliases: nndistF
### Keywords: spatial

### ** Examples

data(uganda)
boxplot(nndistF(as.points(uganda), as.points(csr(uganda$poly, length(uganda$x)))))
plot(ecdf(nndistF(as.points(uganda), 
as.points(csr(uganda$poly, length(uganda$x))))),
main="Fhat ecdf Uganda volcano data")



