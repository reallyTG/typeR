library(VineCopula)


### Name: RVineVuongTest
### Title: Vuong Test Comparing Two R-Vine Copula Models
### Aliases: RVineVuongTest

### ** Examples

## No test: 
# vine structure selection time-consuming (~ 20 sec)

# load data set
data(daxreturns)

# select the R-vine structure, families and parameters
RVM <- RVineStructureSelect(daxreturns[,1:5], c(1:6))

# select the C-vine structure, families and parameters
CVM <- RVineStructureSelect(daxreturns[,1:5], c(1:6), type = "CVine")

# compare the two models based on the data
vuong <- RVineVuongTest(daxreturns[,1:5], RVM, CVM)
vuong$statistic
vuong$statistic.Schwarz
vuong$p.value
vuong$p.value.Schwarz
## End(No test)




