library(uncertainty)


### Name: print.summary.uncertainty
### Title: Displays a list with the uncertainty contribution from each
###   input quantity
### Aliases: print.summary.uncertainty
### Keywords: summary uncertainty print

### ** Examples

# create an uncertainty budget
cor.mat<- matrix(c(1,-0.7,-0.7,1),2,2)

u.budget<- uncertaintyBudget(x=list(name=c("x0","x1"), 
	mean=c(10,20), u=c(1,5), dof=c(10,10),
	label=c("x[0]", "x[1]"), distribution=c("normal","normal")), 
	y=cor.mat)
u.budget

# estimate the measurand uncertainty using an uncertainty budget,
# a measurand definition and a selected estimating method.
GFO.res<- uncertainty(x=u.budget, 
y=list(measurand_name="ratio.GFO", measurand_label="ratio[GFO]", 
measurand_model="x0/x1", method="GFO", alpha=0.05))

GFO.res

# create an uncertainty summary object
GFO.sum<- summary(GFO.res)

# implicit call to the print method
GFO.sum

# same as
print(GFO.sum)

# uncertainty summary structure
attributes(GFO.sum)



