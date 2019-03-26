library(VineCopula)


### Name: RVineStructureSelect
### Title: Sequential Specification of R- and C-Vine Copula Models
### Aliases: RVineStructureSelect

### ** Examples


# load data set
data(daxreturns)

# select the R-vine structure, families and parameters
# using only the first 4 variables and the first 250 observations
# we allow for the copula families: Gauss, t, Clayton, Gumbel, Frank and Joe
daxreturns <- daxreturns[1:250, 1:4]
RVM <- RVineStructureSelect(daxreturns, c(1:6), progress = TRUE)

## see the object's content or a summary
str(RVM)
summary(RVM)

## inspect the fitted model using plots
## Not run: plot(RVM)  # tree structure
contour(RVM)  # contour plots of all pair-copulas

## No test: 
## estimate a C-vine copula model with only Clayton, Gumbel and Frank copulas
CVM <- RVineStructureSelect(daxreturns, c(3,4,5), "CVine")
## End(No test)

## No test: 
## determine the order of the nodes in a D-vine using the package TSP
library(TSP)
d <- dim(daxreturns)[2]
M <- 1 - abs(TauMatrix(daxreturns))
hamilton <- insert_dummy(TSP(M), label = "cut")
sol <- solve_TSP(hamilton, method = "repetitive_nn")
order <- cut_tour(sol, "cut")
DVM <- D2RVine(order, family = rep(0,d*(d-1)/2), par = rep(0, d*(d-1)/2))
RVineCopSelect(daxreturns, c(1:6), DVM$Matrix)
## End(No test)




