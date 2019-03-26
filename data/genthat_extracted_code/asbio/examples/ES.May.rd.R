library(asbio)


### Name: ES.May
### Title: May's effective specialization index
### Aliases: ES.May

### ** Examples

#data from May and Beverton (1990)
beetle<-matrix(ncol=4,nrow=4,data=c(5,8,7,8,20,10,9,8,14,15,11,8,15,15,12,8), 
byrow=TRUE)
ES.May(beetle)



