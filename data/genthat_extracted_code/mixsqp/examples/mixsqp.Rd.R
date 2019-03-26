library(mixsqp)


### Name: mixsqp
### Title: Maximum-likelihood estimation of mixture proportions using SQP
### Aliases: mixsqp mixsqp_control_default

### ** Examples

set.seed(1)
n <- 1e5
m <- 10
w <- rep(1,n)/n
L <- simulatemixdata(n,m)$L
out.mixsqp <- mixsqp(L,w)
f <- mixobjective(L,out.mixsqp$x,w)
print(f,digits = 16)

# We can also compare this result with solution found from an 
# interior-point approach called via the "KWDual" function from the 
# REBayes package. (This requires installation of the MOSEK 
# optimization library as well as the REBayes package, so we have
# made this step optional.)
## Not run: 
##D  
##D out.kwdual <- mixkwdual(L,w)
##D print(mixobjective(L,out.kwdual$x,w),digits = 16)
## End(Not run)



