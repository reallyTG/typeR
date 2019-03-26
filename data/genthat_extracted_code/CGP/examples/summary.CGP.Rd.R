library(CGP)


### Name: summary.CGP
### Title: CGP model summary information
### Aliases: summary.CGP

### ** Examples

x1<-c(0,.02,.075,.08,.14,.15,.155,.156,.18,.22,.29,.32,.36,
      .37,.42,.5,.57,.63,.72,.785,.8,.84,.925,1)
x2<-c(.29,.02,.12,.58,.38,.87,.01,.12,.22,.08,.34,.185,.64,
      .02,.93,.15,.42,.71,1,0,.21,.5,.785,.21)
X<-cbind(x1,x2)
yobs<-sin(1/((x1*0.7+0.3)*(x2*0.7+0.3)))
## Not run: 
##D #Fit the CGP model
##D mod<-CGP(X,yobs)
##D summary(mod)
## End(Not run)



