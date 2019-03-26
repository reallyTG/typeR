library(secure)


### Name: secure.path
### Title: Sequential Co-Sparse Factor Regression
### Aliases: secure secure.path

### ** Examples

#require(secure)

# Simulate data from a sparse factor regression model
p <- 100; q <- 100; n <- 200
xrho <- 0.5; nlambda <- 100 
nrank <- 3 

U <- matrix(0,ncol=nrank ,nrow=p);  V <- matrix(0,ncol=nrank ,nrow=q)
U[,1]<-c(sample(c(1,-1),8,replace=TRUE),rep(0,p-8))
U[,2]<-c(rep(0,5),sample(c(1,-1),9,replace=TRUE),rep(0,p-14))
U[,3]<-c(rep(0,11),sample(c(1,-1),9,replace=TRUE),rep(0,p-20))
V[,1]<-c(sample(c(1,-1),5,replace=TRUE)*runif(5,0.3,1),rep(0,q-5))
V[,2]<-c(rep(0,5),sample(c(1,-1),5,replace=TRUE)*runif(5,0.3,1),rep(0,q-10))
V[,3]<-c(rep(0,10),sample(c(1,-1),5,replace=TRUE)*runif(5,0.3,1),rep(0,q-15))
U[,1:3]<- apply(U[,1:3],2,function(x)x/sqrt(sum(x^2)))
V[,1:3]<- apply(V[,1:3],2,function(x)x/sqrt(sum(x^2)))
D <- diag(c(20,15,10)) 
C <- U%*%D%*%t(V)

Xsigma <- xrho^abs(outer(1:p, 1:p,FUN="-"))
sim.sample <- secure.sim(U,D,V,n,snr = 0.25,Xsigma,rho=0.3)
Y <- sim.sample$Y; 
X <- sim.sample$X



# Fitting secure. Set maximum rank to be 4.
rank.ini <- 4

# Set largest model to about 25% sparsity
# See secure.control for setting other parameters
control <- secure.control(spU=0.25, spV=0.25)

# Complete data case. 
# Fit secure without orthogonality
fit.orthF <- secure.path(Y,X,nrank=rank.ini,nlambda = nlambda,
                        control=control)
# check orthogonality
crossprod(X%*%fit.orthF$U)/n
# check solution
# fit.orthF$U
# fit.orthF$V
# fit.orthF$D

# Fit secure with orthogonality if desired. It takes longer time.
# fit.orthT <- secure.path(Y,X,nrank=rank.ini,nlambda = nlambda,
#                                   orthXU=TRUE,orthV=TRUE,control=control)
# check orthogonality
# crossprod(X%*%fit.orthT$U)/n

  
# 15% missing case
miss <- 0.15
t.ind <- sample.int(n*q, size = miss*n*q)
y <- as.vector(Y); y[t.ind] <- NA;  Ym <- matrix(y,n,q)

fit.orthF.miss <- secure.path(Ym, X, nrank = rank.ini, nlambda = nlambda, 
                            control = control) 
# fit.orthT.miss <- secure.path(Ym, X, nrank = rank.ini, nlambda = nlambda,
#                           orthXU=TRUE,orthV=TRUE, control = control)



