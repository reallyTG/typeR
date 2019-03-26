library(RandomFields)


### Name: RMdeclare
### Title: Declaration of dummy variables for statistical inference
### Aliases: RMdeclare RM_DECLARE
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## The following two examples illustrate the use of RMdeclare and the
## argument 'params'. The purpose is not to give nice statistical models 

x <- seq(1, 3, 0.1)
## note that there isn't any harm to declare variables ('u')
## RMdeclare that are of no use in a simulation
model <- ~ RMexp(sc=sc1, var=var1) + RMgauss(var=var2, sc=sc2) + RMdeclare(u)
p <- list(sc1=2, var1=3, sc2=4, var2=5)
z <- RFsimulate(model = model, x=x, y=x, params=p)
plot(z)

## note that the model remains the same, only the values in the
## following list change. Here, sc1, var1, sc2 and u are estimated
## and var2 is given by a forula.
p.fit <- list(sc1 = NA, var1=NA, var2=~2 * u, sc2 = NA, u=NA)
lower <- list(sc1=20, u=5)
upper <- list(sc2=1.5, sc1=100, u=15)
f <- RFfit(model, data=z, params=p.fit, lower = lower, upper = upper)
print(f)


## The second example shows that rather complicated constructions are
## possible, i.e., formulae involving several variables, both known ('abc')
## and unknown ones ('sc', 'var'). Note that there are two different
## 'var's a unknown variable and an argument for RMwhittle
## Not run: ##D 
##D 	 ##D 
##D model2 <- ~ RMexp(sc) + RMwhittle(var = g, nu=Nu) + 
##D   RMnugget(var=nugg) +  RMexp(var=var, Aniso=matrix(A, nc=2)) +
##D   RMdeclare(CCC, DD)
##D p.fit <- list(g=~sc^1.5,  nugg=~sc * var * abc, sc=NA, var=~DD, Nu=NA, abc=123,
##D 	      A = ~c(1, 2, DD * CCC, CCC), CCC = NA, DD=NA)
##D lower <- list(sc=1, CCC=1, DD=1)
##D upper <- list(sc=100, CCC=100, DD=100)
##D f2 <- RFfit(model2, data=z, params=p.fit, lower = lower, upper = upper)
##D print(f2)
## End(Not run)

## Don't show: 
FinalizeExample()
## End(Don't show)



