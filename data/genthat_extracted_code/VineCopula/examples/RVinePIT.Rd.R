library(VineCopula)


### Name: RVinePIT
### Title: Probability Integral Transformation for R-Vine Copula Models
### Aliases: RVinePIT

### ** Examples

# load data set
data(daxreturns)

# select the R-vine structure, families and parameters
RVM <- RVineStructureSelect(daxreturns[,1:3], c(1:6))

# PIT data
pit <- RVinePIT(daxreturns[,1:3], RVM)

par(mfrow = c(1,2))
plot(daxreturns[,1], daxreturns[,2])	# correlated data
plot(pit[,1], pit[,2])	# i.i.d. data

cor(pit, method = "kendall")




