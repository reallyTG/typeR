library(Hmisc)


### Name: rcorr
### Title: Matrix of Correlations and P-values
### Aliases: rcorr print.rcorr
### Keywords: nonparametric htest category

### ** Examples

x <- c(-2, -1, 0, 1, 2)
y <- c(4,   1, 0, 1, 4)
z <- c(1,   2, 3, 4, NA)
v <- c(1,   2, 3, 4, 5)
rcorr(cbind(x,y,z,v))



