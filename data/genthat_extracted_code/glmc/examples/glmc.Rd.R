library(glmc)


### Name: glmc
### Title: Fitting Generalised Linear Models Subject to Population
###   Constraints
### Aliases: glmc
### Keywords: models regression

### ** Examples

library(glmc)
#Specify the data. 

n <- rbind(c(5903,230),c(5157,350))
mat <- matrix(0,nrow=sum(n),ncol=2)
mat <- rbind(matrix(1,nrow=n[1,1],ncol=1)%*%c(0,0),
             matrix(1,nrow=n[1,2],ncol=1)%*%c(0,1),
             matrix(1,nrow=n[2,1],ncol=1)%*%c(1,0),
             matrix(1,nrow=n[2,2],ncol=1)%*%c(1,1))

#Specifying the population constraints.

gfr <- .06179*matrix(1,nrow=nrow(mat),ncol=1)
g <- matrix(1,nrow=nrow(mat),ncol=1)
amat <- matrix(mat[,2]*g-gfr,ncol=1)

# Method 1. Defining constraints in the data frame.

hrh <- data.frame(birth=mat[,2], child=mat[,1], constraints=amat)

gfit <- glmc(birth~child, data=hrh, family="binomial",emplik.method="Owen",
             control=glmc.control(maxit.glm=10,maxit.weights=200,
             itertrace.weights=TRUE,gradtol.weights=10^(-6)))

summary.glmc(gfit)

# Method 2. Defining constraints through a matrix.

gfit<- glmc(mat[,2]~mat[,1],family=binomial(link=logit),
            emplik.method="Owen",control=glmc.control(maxit.glm=10,
            maxit.weights=200,itertrace.weights=TRUE,gradtol.weights=10^(-10)),
            Amat=amat,confn=NULL)

summary.glmc(gfit)

## Not run: 
##D # Method 3. Defining constraints through a function.
##D 
##D fn <- function(t,Y,X){
##D grf <- .06179*matrix(1,nrow=nrow(as.matrix(X)),ncol=1)
##D g <- matrix(1,nrow=nrow(X),ncol=1)
##D amat <- matrix(Y*g-grf,ncol=1)
##D return(amat)
##D }
##D 
##D gfit <- glmc(birth~child,data=hrh,family=binomial(link=logit),
##D              optim.method="BFGS",emplik.method="Owen",
##D              control=glmc.control(maxit.glm=10,maxit.optim=10^(8),
##D              reltol.optim=10^(-10),trace.optim=9,REPORT.optim=1,
##D              maxit.weights=200,gradtol.weights=10^(-6),itertrace.weights=FALSE),
##D              optim.hessian=TRUE,Amat=NULL,confn=fn)
##D 
##D summary.glmc(gfit)
##D     
## End(Not run) 



