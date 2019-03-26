library(uncertainty)


### Name: plot.summary.uncertainty
### Title: Plots an uncertainty summary. It shows the uncertainty
###   contribution from each involved quantity
### Aliases: plot.summary.uncertainty
### Keywords: barplot summary uncertainty plot

### ** Examples

# create an uncertainty budget
cor.mat<- matrix(c(1,-0.7,-0.7,1),2,2)

u.budget<- uncertaintyBudget(x=list(name=c("x0","x1"), 
	mean=c(10,20), u=c(1,5), dof=c(10,10),
	label=c("x[0]", "x[1]"), distribution=c("normal","normal")), 
	y=cor.mat)

# estimate the measurand uncertainty using an uncertainty budget,
# a measurand definition and a selected estimating method.
GFO.res<- uncertainty(x=u.budget, 
y=list(measurand_name="ratio.GFO", measurand_label="ratio[GFO]", 
measurand_model="x0/x1", method="GFO", alpha=0.05))

# create an uncertainty summary object
GFO.sum<- summary(GFO.res)

# display the chart
## Not run: plot(GFO.sum)




