library(agricolae)


### Name: order.group
### Title: Ordering the treatments according to the multiple comparison
### Aliases: order.group
### Keywords: manip

### ** Examples

library(agricolae)
treatments <- c("A","B","C","D","E","F")
means<-c(20,40,35,72,49,58)
std.err<-c(1.2, 2, 1.5, 2.4, 1, 3.1)
replications <- c(4,4,3,4,3,3)
MSerror <- 55.8
value.t <- 2.1314
groups<-order.group(treatments,means,replications,MSerror,value.t,std.err,console=FALSE)
print(groups)



