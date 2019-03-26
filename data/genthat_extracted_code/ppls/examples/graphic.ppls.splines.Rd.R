library(ppls)


### Name: graphic.ppls.splines
### Title: Plots for penalized PLS based on Spline Transformations
### Aliases: graphic.ppls.splines
### Keywords: multivariate

### ** Examples

# ------------------------------------------------------
# load boston housing data

library(MASS)
data(Boston)
y<-Boston[,14]
X<-Boston[,-14]
X<-X[,-4] # remove categorical variable
X<-as.matrix(X)

# ----------------------------------------------------------------------
# plot ppls results for some random parameters 

# with variable selection , and with data (add.data=TRUE)
dummy<-graphic.ppls.splines(X,y,lambda=100,ncomp=5,add.data=TRUE,select=TRUE,window.size=c(3,4))

# without variable selection and without data

dummy<-graphic.ppls.splines(X,y,lambda=100,ncomp=5,add.data=FALSE,select=FALSE,window.size=c(3,4))




