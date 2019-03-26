library(MCMCglmm)


### Name: spl
### Title: Orthogonal Spline Design Matrix
### Aliases: spl
### Keywords: manip

### ** Examples

## Not run: 
##D x<-rnorm(100)
##D y<-x^2+cos(x)-x+0.2*x^3+rnorm(100)
##D plot(y~x)
##D lines((x^2+cos(x)-x+0.2*x^3)[order(x)]~sort(x))
##D 
##D dat<-data.frame(y=y, x=x)
##D 
##D m1<-MCMCglmm(y~x, random=~idv(spl(x)), data=dat, pr=TRUE, verbose=FALSE) # penalised smoother
##D m2<-MCMCglmm(y~x+spl(x),data=dat,  verbose=FALSE)                        # non-penalised
##D 
##D pred1<-(cbind(m1$X,m1$Z)%*%colMeans(m1$Sol))@x
##D pred2<-(cbind(m2$X)%*%colMeans(m2$Sol))@x
##D 
##D lines(pred1[order(x)]~sort(x), col="red")
##D lines(pred2[order(x)]~sort(x), col="green")
##D 
##D m1$DIC-mean(m1$Deviance)  # effective number of parameters < 13
##D m2$DIC-mean(m2$Deviance)  # effective number of parameters ~ 13
## End(Not run)



