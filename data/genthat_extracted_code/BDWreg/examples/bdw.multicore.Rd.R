library(BDWreg)


### Name: bdw.mc
### Title: Producing several chains from a MCMC object of class 'bdw'
### Aliases: bdw.mc
### Keywords: multicore

### ** Examples

## Not run: 
##D   #==== multicore example - estimating logit-DW(regQ,B) parameters using RJ and 5 chains ======
##D   #==== Two variables and four coefficients, including intercepts, are simulated and analysed
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
##D   result = bdw(data = data              ,
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
##D   result2 = bdw.mc(result,5) # <<<- multicore
##D   plot(result2)
##D   summary(result2)
## End(Not run)



