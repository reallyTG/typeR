library(ssanv)


### Name: uniroot.integer
### Title: Find the root of a function to the nearest integer
### Aliases: uniroot.integer
### Keywords: htest

### ** Examples

root.func<-function(i) i - 500.1 
## initial step sizes = 2^2 =4
uniroot.integer(root.func,c(0,Inf),step.power=2)
## more efficient to use bigger initial step sizes = 2^10 =1024
uniroot.integer(root.func,c(0,Inf),step.power=10,print.steps=TRUE)



