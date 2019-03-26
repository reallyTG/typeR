library(Lock5withR)


### Name: RetailSales
### Title: Retail Sales
### Aliases: RetailSales
### Keywords: datasets

### ** Examples


data(RetailSales)
if (require(lattice)) {
  xyplot(Sales ~ Date, RetailSales, type='l')
  xyplot(Sales ~ Date, RetailSales, type='l', groups=Month)
}




