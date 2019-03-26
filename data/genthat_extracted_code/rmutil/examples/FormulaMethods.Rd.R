library(rmutil)


### Name: FormulaMethods
### Title: Methods for formulafn Functions
### Aliases: covariates.formulafn formula.formulafn model model.formulafn
###   parameters parameters.formulafn print.formulafn
### Keywords: manip

### ** Examples

x1 <- rpois(20,2)
x2 <- rnorm(20)
#
# Wilkinson and Rogers formula with three parameters
fn1 <- finterp(~x1+x2)
fn1
covariates(fn1)
formula(fn1)
model(fn1)
parameters(fn1)
#
# nonlinear formula with unknowns
fn2 <- finterp(~exp(b0+b1*x1+b2*x2))
fn2
covariates(fn2)
formula(fn2)
model(fn2)
parameters(fn2)
#
# function transformed by fnenvir
fn3 <- fnenvir(function(p) p[1]+p[2]*x1)
covariates(fn3)
formula(fn3)
model(fn3)
parameters(fn3)



