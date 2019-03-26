library(yuima)


### Name: setIntegral
### Title: Integral of Stochastic Differential Equation
### Aliases: setIntegral

### ** Examples

## Not run: 
##D # Definition Model
##D 
##D Mod1<-setModel(drift=c("a1"), diffusion = matrix(c("s1"),1,1),
##D   solve.variable = c("X"), time.variable = "s")
##D 
##D # In this example we define an integral of SDE such as
##D # \[
##D # I=\int^{t}_{0} b*exp(-a*(t-s))*(X_s-a1*s)dX_s
##D # \]
##D 
##D integ <- matrix("b*exp(-a*(t-s))*(X-a1*s)",1,1)
##D 
##D Integral <- setIntegral(yuima = Mod1,integrand = integ,
##D   var.dx = "X", lower.var = "0", upper.var = "t",
##D   out.var = "", nrow =1 ,ncol=1)
##D 
##D # Structure of slots
##D 
##D is(Integral)
##D # Function h in the above definition
##D Integral@Integral@Integrand@IntegrandList
##D # Dimension of Intgrand
##D Integral@Integral@Integrand@dimIntegrand
##D 
##D # all parameters are $\left(b,a,a1,s1\right)$
##D Integral@Integral@param.Integral@allparam
##D 
##D # the parameters in the integrand are $\left(b,a,a1\right)$ \newline
##D Integral@Integral@param.Integral@Integrandparam
##D 
##D # common parameters are $a1$
##D Integral@Integral@param.Integral@common
##D 
##D # integral variable dX_s
##D Integral@Integral@variable.Integral@var.dx
##D Integral@Integral@variable.Integral@var.time
##D 
##D # lower and upper vars
##D Integral@Integral@variable.Integral@lower.var
##D Integral@Integral@variable.Integral@upper.var
##D 
## End(Not run)



