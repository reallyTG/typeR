library(didrooRFM)


### Name: findRFM
### Title: Compute RFM for Transaction Data
### Aliases: findRFM

### ** Examples

TransNo <- c('0','1')
CustomerID <- c('Cust1','Cust2')
DateofPurch <- as.Date(c('2010-11-1','2008-3-25'))
Amount <- c(1000,500)
customerData <- data.frame(TransNo,CustomerID,DateofPurch,Amount)
findRFM(customerData)



