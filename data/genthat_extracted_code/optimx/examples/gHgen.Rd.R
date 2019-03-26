library(optimx)


### Name: gHgen
### Title: Generate gradient and Hessian for a function at given
###   parameters.
### Aliases: gHgen
### Keywords: nonlinear optimize

### ** Examples

# genrose function code
genrose.f<- function(x, gs=NULL){ # objective function
## One generalization of the Rosenbrock banana valley function (n parameters)
	n <- length(x)
        if(is.null(gs)) { gs=100.0 }
	fval<-1.0 + sum (gs*(x[1:(n-1)]^2 - x[2:n])^2 + (x[2:n] - 1)^2)
        return(fval)
}

genrose.g <- function(x, gs=NULL){
# vectorized gradient for genrose.f
# Ravi Varadhan 2009-04-03
	n <- length(x)
        if(is.null(gs)) { gs=100.0 }
	gg <- as.vector(rep(0, n))
	tn <- 2:n
	tn1 <- tn - 1
	z1 <- x[tn] - x[tn1]^2
	z2 <- 1 - x[tn]
	gg[tn] <- 2 * (gs * z1 - z2)
	gg[tn1] <- gg[tn1] - 4 * gs * x[tn1] * z1
	return(gg)
}

genrose.h <- function(x, gs=NULL) { ## compute Hessian
   if(is.null(gs)) { gs=100.0 }
	n <- length(x)
	hh<-matrix(rep(0, n*n),n,n)
	for (i in 2:n) {
		z1<-x[i]-x[i-1]*x[i-1]
#		z2<-1.0-x[i]
                hh[i,i]<-hh[i,i]+2.0*(gs+1.0)
                hh[i-1,i-1]<-hh[i-1,i-1]-4.0*gs*z1-4.0*gs*x[i-1]*(-2.0*x[i-1])
                hh[i,i-1]<-hh[i,i-1]-4.0*gs*x[i-1]
                hh[i-1,i]<-hh[i-1,i]-4.0*gs*x[i-1]
	}
        return(hh)
}

trad<-c(-1.2,1)
ans100fgh<-  gHgen(trad, genrose.f, gr=genrose.g, hess=genrose.h,
      control=list(ktrace=1)) 
print(ans100fgh)
ans100fg<-  gHgen(trad, genrose.f, gr=genrose.g, 
      control=list(ktrace=1)) 
print(ans100fg)
ans100f<-  gHgen(trad, genrose.f, control=list(ktrace=1)) 
print(ans100f)
ans10fgh<-   gHgen(trad, genrose.f, gr=genrose.g, hess=genrose.h,
      control=list(ktrace=1), gs=10) 
print(ans10fgh)
ans10fg<-   gHgen(trad, genrose.f, gr=genrose.g, 
      control=list(ktrace=1), gs=10) 
print(ans10fg)
ans10f<-   gHgen(trad, genrose.f, control=list(ktrace=1), gs=10) 
print(ans10f)




