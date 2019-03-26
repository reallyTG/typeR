library(CGP)


### Name: plotCGP
### Title: Jackknife (leave-one-out) actual by predicted diagnostic plot
### Aliases: plotCGP

### ** Examples

x1<-c(0,.02,.075,.08,.14,.15,.155,.156,.18,.22,.29,.32,.36,
.37,.42,.5,.57,.63,.72,.785,.8,.84,.925,1)
x2<-c(.29,.02,.12,.58,.38,.87,.01,.12,.22,.08,.34,.185,.64,
.02,.93,.15,.42,.71,1,0,.21,.5,.785,.21)
X<-cbind(x1,x2)
yobs<-x1^2+x2^2
## Not run: 
##D #The CGP model
##D mod<-CGP(X,yobs,nugget_l=0.001)
##D plotCGP(mod)
## End(Not run)



