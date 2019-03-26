library(errint)


### Name: acc_intervals
### Title: Accuracy of Error intervals
### Aliases: acc_intervals

### ** Examples

interv<-int_gau(rnorm(10),0.1)
acc_intervals(interv,rnorm(10))
acc_intervals(interv,rnorm(10),function(x,y){x-y})



