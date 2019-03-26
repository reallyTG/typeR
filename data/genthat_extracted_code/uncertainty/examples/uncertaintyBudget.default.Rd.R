library(uncertainty)


### Name: uncertaintyBudget.default
### Title: Generic function for calling an uncertainty budget object
### Aliases: uncertaintyBudget.default
### Keywords: uncertainty budget distribution

### ** Examples

require(mvtnorm)

cor.mat<- matrix(c(1,-0.7,-0.7,1),2,2)

u.budget<- uncertaintyBudget(x=list(name=c("x0","x1"), 
	mean=c(10,20), u=c(1,5), dof=c(10,10),
	label=c("x[0]", "x[1]"), distribution=c("normal","normal")), y=cor.mat)
u.budget



