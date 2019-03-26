library(Rsolnp)


### Name: solnp
### Title: Nonlinear optimization using augmented Lagrange method.
### Aliases: solnp
### Keywords: optimize

### ** Examples

# From the original paper by Y.Ye
# see the unit tests for more....
#---------------------------------------------------------------------------------
# POWELL Problem
fn1=function(x)
{
	exp(x[1]*x[2]*x[3]*x[4]*x[5])
}

eqn1=function(x){
	z1=x[1]*x[1]+x[2]*x[2]+x[3]*x[3]+x[4]*x[4]+x[5]*x[5]
	z2=x[2]*x[3]-5*x[4]*x[5]
	z3=x[1]*x[1]*x[1]+x[2]*x[2]*x[2]
	return(c(z1,z2,z3))
}


x0 = c(-2, 2, 2, -1, -1)
powell=solnp(x0, fun = fn1, eqfun = eqn1, eqB = c(10, 0, -1))



