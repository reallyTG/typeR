library(VineCopula)


### Name: RVineClarkeTest
### Title: Clarke Test Comparing Two R-Vine Copula Models
### Aliases: RVineClarkeTest

### ** Examples



# vine structure selection time-consuming (~ 20 sec)

# load data set
data(daxreturns)
## Don't show: 
daxreturns <- daxreturns[1:200, ]
## End(Don't show)

# select the R-vine structure, families and parameters
RVM <- RVineStructureSelect(daxreturns[,1:5], c(1:6))
RVM$Matrix
RVM$par
RVM$par2

# select the C-vine structure, families and parameters
CVM <- RVineStructureSelect(daxreturns[,1:5], c(1:6), type = "CVine")
CVM$Matrix
CVM$par
CVM$par2

# compare the two models based on the data
clarke <- RVineClarkeTest(daxreturns[,1:5], RVM, CVM)
clarke$statistic
clarke$statistic.Schwarz
clarke$p.value
clarke$p.value.Schwarz




