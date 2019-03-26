library(uncertainty)


### Name: print.uncertaintyBudget
### Title: Prints an uncertainty budget object
### Aliases: print.uncertaintyBudget
### Keywords: uncertainty budget print

### ** Examples

cor.mat<- matrix(c(1,-0.7,-0.7,1),2,2)

u.budget<- uncertaintyBudget(x=list(name=c("x0","x1"), 
	mean=c(10,20), u=c(1,5), dof=c(10,10),
	label=c("x[0]", "x[1]"), distribution=c("normal","normal")), 
	y=cor.mat)

# implicitly calls the print method
u.budget

# same as
print(u.budget)

# uncertainty budget structure
attributes(u.budget)



