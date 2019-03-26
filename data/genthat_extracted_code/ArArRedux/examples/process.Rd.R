library(ArArRedux)


### Name: process
### Title: Process logratio data and calculate 40Ar/39Ar ages
### Aliases: process

### ** Examples

data(Melbourne)
ages <- process(Melbourne$X,Melbourne$irr,Melbourne$fract)
summary(ages)



