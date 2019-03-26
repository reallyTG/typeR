library(FinAsym)


### Name: pin_likelihood
### Title: Log-likelihood function for the estimation of the structural
###   model of Easley and O'Hara (1987).
### Aliases: pin_likelihood
### Keywords: pin_likelihood

### ** Examples

#Sample data
mydata<-matrix(c(11, 17, 14, 12, 11, 14, 
17, 14, 16, 8, 9, 13, 13, 13, 15, 7, 11, 
13, 14, 19, 14, 7, 11, 6, 12, 6, 17, 10, 
5, 7), nrow=3, byrow=TRUE)

#Make a starting guess at the solution
par0 <- c(0.5, 0.5, 0.5, 0.5)  

param_optim <- optim(par0, pin_likelihood, 
gr=NULL, mydata)



