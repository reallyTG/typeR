library(sdcMicro)


### Name: print.micro
### Title: Print method for objects from class micro
### Aliases: print.micro
### Keywords: print

### ** Examples


data(free1)
free1 <- as.data.frame(free1)
m1 <- microaggregation(free1[, 31:34], method='onedims', aggr=3)
m1




