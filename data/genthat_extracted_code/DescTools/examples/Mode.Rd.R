library(DescTools)


### Name: Mode
### Title: Mode, Most Frequent Value(s)
### Aliases: Mode
### Keywords: univar

### ** Examples

data(d.pizza)
Mode(d.pizza$driver)

# use sapply for evaluating data.frames (resp. apply for matrices)
sapply(d.pizza[,c("driver","temperature","date")], Mode, na.rm=TRUE)



