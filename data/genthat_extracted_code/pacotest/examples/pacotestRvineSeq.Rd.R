library(pacotest)


### Name: pacotestRvineSeq
### Title: Sequentially Testing the Simplifying Assumption for R-Vine
###   Copulas
### Aliases: pacotestRvineSeq

### ** Examples

# Sample data and R-vine copula selection are taken
# from the documentation of RVineStructureSelect
# of the VineCopula package.

# Obtain sample data
data(daxreturns, package ="VineCopula")
dataSet = daxreturns[1:750,1:4]

# Specify an R-vine copula model
# (can be obtained by calling: RVM = VineCopula::RVineStructureSelect(dataSet))
vineStructure = matrix(c(3,4,1,2,0,2,4,1,0,0,1,4,0,0,0,4),4,4)
families = matrix(c(0,5,2,2,0,0,2,14,0,0,0,14,0,0,0,0),4,4)
par = matrix(c(0,0.8230664,0.1933472,0.6275062,
             0,0,0.2350109,1.6619945,
             0,0,0,1.599363,
             0,0,0,0),4,4)
par2 = matrix(c(0,0,11.757700,4.547847,
             0,0,17.15717,0,
             0,0,0,0,0,0,0,0),4,4)
RVM = VineCopula::RVineMatrix(vineStructure, families, par, par2)


# Specify a pacotestOptions list:
pacotestOptions = pacotestset('CCC')

# Test for the simplifying assumption.
pacotestResultList = pacotestRvineSeq(dataSet, RVM,
                                      pacotestOptions)



