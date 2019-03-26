library(SixSigma)


### Name: ss.data.bills
### Title: Errors in bills data set
### Aliases: ss.data.bills
### Keywords: datasets

### ** Examples


data(ss.data.bills)
str(ss.data.bills) 
barplot(table(ss.data.bills$clerk), 
    main = "number of invoices")
aggregate(errors ~ clerk, ss.data.bills, sum)




