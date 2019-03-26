library(IndianTaxCalc)


### Name: ITI2018
### Title: Income Tax-India (FY 2017-2018)
### Aliases: ITI2018
### Keywords: Tax Finance

### ** Examples

##Income Tax calculation for individual
ITI2018(330000)

##Income Tax calculation for Senior Citizen
ITI2018(580000,2)

##Income Tax calculation for group of individuals
employees<-c(250000,350000,200000,7500000)
ITI2018(employees,1)

##Income Tax calculation for dataframe with mixed category of data
sdata <- data.frame(income = c(300000, 600000, 5000000,15000000),
                  category = c(1, 2, 3, 4))
ITI2018(sdata$income,sdata$category)



