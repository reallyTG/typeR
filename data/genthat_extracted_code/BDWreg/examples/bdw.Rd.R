library(BDWreg)


### Name: bdw
### Title: Bayesian parameter estimation for discrete Weibull regression
### Aliases: bdw
### Keywords: Discrete Weibull regression Reversible-Jumps
###   Metropolise-Hasings

### ** Examples

set.seed(123)
#========== example 1 - estimating DW parameters under logit transformation ==========
q = .41    # <<< true parameters
b = 1.1    # <<< true parameters
y = BDWreg:::rdw(n = 200,q = q,beta = b) #<<< generating data
result  = bdw(data = y, v.scale = .10,initial = c(.5,.5),iteration = 8000 )
plot(result)
summary(result)


## Not run: 
##D   #==== example 2 - estimating logit-DW(regQ,beta) parameters using RJ ======
##D   set.seed(1234)
##D   n = 500
##D   x1 = runif(n = n, min = 0, max = 1.5)
##D   x2 = runif(n = n, min = 0, max = 1.5)
##D 
##D   theta0 = .6   #<<< true parameter
##D   theta1 =  0   #<<< true parameter
##D   theta2 = .34  #<<< true parameter
##D 
##D   lq = theta0 +  x1*theta1 + x2*theta2
##D 
##D   q = exp(lq - log(1+exp(lq)) )
##D   beta = 1.5
##D 
##D   y = c()
##D   for(i in 1:n){
##D     y[i] = BDWreg:::rdw(1,q = q[i],beta = beta)
##D   }
##D 
##D   data = data.frame(x1,x2,y) # <<<- data
##D   result2 = bdw(data = data              ,
##D                formula = y~.             ,
##D                RJ = TRUE                 ,
##D                initial = rep(.5,4)       ,
##D                iteration = 25000         ,
##D                reg.b = FALSE,reg.q = TRUE,
##D                v.scale = .1              ,
##D                q.par = c(0,1)            ,
##D                b.par = c(0,1)            ,
##D                dist.q = dnorm            ,
##D                dist.b = dnorm
##D   )
##D   plot(result2)
##D   summary(result2)
## End(Not run)



