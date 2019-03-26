library(IndianTaxCalc)


### Name: ITI2017
### Title: Income Tax-India (FY 2016-2017)
### Aliases: ITI2017
### Keywords: Tax Finance

### ** Examples

##Income Tax calculation for individual
ITI2017(330000)

##Income Tax calculation for Senior Citizen
ITI2017(480000,2)

##Income Tax calculation for group of individuals
employees<-c(250000,350000,200000,7500000)
ITI2017(employees,1)

##Income Tax calculation for dataframe with mixed category of data
sdata <- data.frame(income = c(300000, 400000, 5000000,15000000),
                  category = c(1, 2, 3, 4))
ITI2017(sdata$income,sdata$category)



