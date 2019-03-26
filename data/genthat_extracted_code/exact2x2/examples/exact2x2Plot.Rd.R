library(exact2x2)


### Name: exact2x2Plot
### Title: Plot p-value function for one 2 by 2 table.
### Aliases: exact2x2Plot
### Keywords: hplot

### ** Examples

example1<-matrix(c(6,12,12,5),2,2,dimnames=list(c("Group A","Group B"),c("Event","No Event")))
example1
exact2x2Plot(example1)
## add lines from central Fisher's exact
exact2x2Plot(example1,method="central",dolines=TRUE,newplot=FALSE,col="red")



