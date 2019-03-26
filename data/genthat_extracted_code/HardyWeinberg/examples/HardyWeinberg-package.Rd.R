library(HardyWeinberg)


### Name: HardyWeinberg-package
### Title: Statistical Tests and Graphics for Hardy-Weinberg Equilibrium
### Aliases: HardyWeinberg-package HardyWeinberg
### Keywords: package

### ** Examples


library(HardyWeinberg)

# draw random SNPs from a population that is in HWE

set.seed(123)

m <- 100 # number of markers
n <- 100 # sample size

X <- HWData(n,m)
out <- HWTernaryPlot(X,100,region=1,vertex.cex=2,signifcolour=TRUE)




