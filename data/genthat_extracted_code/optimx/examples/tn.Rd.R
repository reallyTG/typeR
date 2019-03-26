library(optimx)


### Name: tn
### Title: Truncated Newton minimization of an unconstrained function.
### Aliases: tn
### Keywords: nonlinear optimize

### ** Examples

#####################
## All examples are in this .Rd file
##
## Rosenbrock Banana function
fr <- function(x) {
    x1 <- x[1]
    x2 <- x[2]
    100 * (x2 - x1 * x1)^2 + (1 - x1)^2
}
gr <- function(x) {
    x1 <- x[1]
    x2 <- x[2]
    g1 <- -400 * (x2 - x1*x1) * x1 - 2*(1-x1)
    g2 <- 200*(x2 - x1*x1) 
    gg<-c(g1, g2)
}

rosefg<-function(x){
   f<-fr(x)
   g<-gr(x)
   attr(f, "gradient") <- g
   f
}

x<-c(-1.2, 1)

ansrosenbrock <- tn(x, rosefg)
print(ansrosenbrock) # use print to allow copy to separate file that 
cat("Compare to optim\n")
ansoptrose <- optim(x, fr, gr)
print(ansoptrose)


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
	gg
}

grosefg<-function(x, gs=100.0) {
    f<-genrose.f(x, gs)
    g<-genrose.g(x, gs)
    attr(f, "gradient") <- g
    f
}

n <- 100
x <- (1:100)/20
groseu<-tn(x, grosefg, gs=10)
print(groseu)

groseuo <- optim(x, fn=genrose.f, gr=genrose.g, method="BFGS",
      control=list(maxit=1000), gs=10)
cat("compare optim BFGS\n")
print(groseuo)


lower<-1+(1:n)/100
upper<-5-(1:n)/100
xmid<-0.5*(lower+upper)

grosec<-tnbc(xmid, grosefg, lower, upper)
print(grosec)

cat("compare L-BFGS-B\n")
grosecl <- optim(par=xmid, fn=genrose.f, gr=genrose.g, 
     lower=lower, upper=upper, method="L-BFGS-B")
print(grosecl)





