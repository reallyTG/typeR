library(CGP)


### Name: CGP
### Title: Fit composite Gaussian process models
### Aliases: CGP

### ** Examples


x1<-c(0,.02,.075,.08,.14,.15,.155,.156,.18,.22,.29,.32,.36,
      .37,.42,.5,.57,.63,.72,.785,.8,.84,.925,1)
x2<-c(.29,.02,.12,.58,.38,.87,.01,.12,.22,.08,.34,.185,.64,
      .02,.93,.15,.42,.71,1,0,.21,.5,.785,.21)
X<-cbind(x1,x2)
yobs<-sin(1/((x1*0.7+0.3)*(x2*0.7+0.3)))

## Not run: 
##D #Fit the CGP model
##D #Increase the lower bound for nugget to 0.01 (Optional)
##D mod<-CGP(X,yobs,nugget_l=0.01)
##D summary(mod)
##D 
##D mod$objval
##D #-27.4537
##D mod$lambda
##D #0.6210284
##D mod$theta
##D #6.065497 8.093402 
##D mod$alpha
##D #143.1770 145.2049 
##D mod$bandwidth
##D #1
##D mod$rmscv
##D #0.5714969
## End(Not run)



