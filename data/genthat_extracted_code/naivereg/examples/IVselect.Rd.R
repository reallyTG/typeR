library(naivereg)


### Name: IVselect
### Title: Selecting instrument variables using group lasso and B-splines
### Aliases: IVselect

### ** Examples

#IV selecting with group Lasso an B-splines
library(naivereg)
data("naivedata")
x=naivedata[,1]
y=naivedata[,2]
z=naivedata[,3:102]
IV = IVselect(z,x)
IV$IVselect	#show the IV selected after B-splines



