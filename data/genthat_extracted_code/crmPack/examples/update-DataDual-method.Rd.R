library(crmPack)


### Name: update,DataDual-method
### Title: Update method for the "DataDual" class
### Aliases: update,DataDual-method
### Keywords: methods

### ** Examples


# Create some data of class 'DataDual'
myData <- DataDual(x=c(0.1,0.5,1.5,3,6,10,10,10),
                   y=c(0,0,0,0,0,0,1,0),
                   w=rnorm(8),
                   doseGrid=c(0.1,0.5,1.5,3,6,
                              seq(from=10,to=80,by=2)))

## update the data with a new cohort
myData <- update(myData,
                 x=20,
                 y=c(0,1,1),
                 w=c(0.4,1.2,2.2))




