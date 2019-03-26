library(nlWaldTest)


### Name: nlWaldtest
### Title: Nonlinear restriction(s) Wald test
### Aliases: nlWaldtest

### ** Examples

set.seed(13)
x1<-rnorm(30);x2<-rnorm(30);x3<-rnorm(30);y<-rnorm(30)
set.seed(NULL)
lm1<-lm(y~x1+x2+x3)
nlConfint(lm1, "b[2]^3+b[3]*b[1];b[2]")
nlWaldtest(lm1,"a[2]^3+a[3]*a[1] = x[1]; a[2]", x = -0.07)
nlWaldtest(lm1,c("b[2]^3+b[3]*b[1]+0.07", "b[2]"))



# Reproduce example in EVievs 8 Users Guide II, pp. 149-151.

## Not run: 
##D require(nlme) 
##D nl1<-nls(log(q)~c1+c2*log(c3*(k^c4)+(1-c3)*(l^c4)),
##D data=CESdata,start=list(c1=-2.6,c2=1.8,c3=0.0001,c4=-6),
##D nls.control(maxiter = 100, tol = 1e-05,minFactor = 1/2^15))
##D nlWaldtest(nl1,"b[2]-1/b[4]",0)
##D nlWaldtest(nl1,"b[2]*b[4]",1)
## End(Not run)



