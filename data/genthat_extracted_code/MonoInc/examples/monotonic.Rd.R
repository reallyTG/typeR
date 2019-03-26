library(MonoInc)


### Name: monotonic
### Title: Monotonic Check
### Aliases: monotonic
### Keywords: mono

### ** Examples

data(simulated_data)
## Run monotonic
test <- monotonic(simulated_data, 1,3, direction='inc')

## look at the number of ids that are non-monotonic
table(as.logical(test[,2]))

##to ignore NA values
x<-c(1,2,3,5,NA,7,8)
monotonic(na.omit(x), direction='inc')




