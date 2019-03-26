library(sensitivity)


### Name: testmodels
### Title: Test Models for Sensitivity Analysis
### Aliases: testmodels sobol.fun ishigami.fun morris.fun atantemp.fun
###   campbell1D.fun linkletter.fun
### Keywords: misc

### ** Examples

## No test: 

# Examples for the functional toy fonctions

# atantemp function

y0 <- atantemp.fun(matrix(c(-7,0,7,-7,0,7),ncol=2))
plot(y0[1,],type="l")
apply(y0,1,lines)

n <- 100
X <- matrix(c(runif(2*n,-7,7)),ncol=2)
y <- atantemp.fun(X)
x11()
plot(y0[2,],ylim=c(-2,2),type="l")
apply(y,1,lines)

# campbell1D function

N1=100         # nombre de simulations pour courbes 1D
min=-1 ; max=5
nominal=(max+min)/2

X1 = NULL ; y1 = NULL
Xnom=matrix(nominal,nr=1,nc=4)
ynom=campbell1D.fun(Xnom,theta=-90:90)
x11()
plot(ynom,ylim=c(8,30),type="l",col="red")
for (i in 1:N1){
  X=matrix(runif(4,min=min,max=max),nr=1,nc=4)
  rbind(X1,X)
  y=campbell1D.fun(X,theta=-90:90)
  rbind(y1,y)
  lines(y)
}

## End(No test)



