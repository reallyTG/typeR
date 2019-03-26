library(changepoint)


### Name: cpts.full<-
### Title: Generic Function - cpts.full<-
### Aliases: cpts.full<-
### Keywords: methods cpt internal

### ** Examples

x=new("cpt.range") # new cpt.range object
cpts.full(x)<-matrix(c(10,20,10,NA),nrow=2,byrow=TRUE) 
# replaces the vector of changepoint in object x with the given matrix



