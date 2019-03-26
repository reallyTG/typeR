library(Stem)


### Name: Stem.Bootstrap
### Title: Parametric bootstrap
### Aliases: Stem.Bootstrap
### Keywords: models spatial

### ** Examples

#load the data
data(pm10)

#extract the data
coordinates <- pm10$coords
covariates <- pm10$covariates
z <- pm10$z

#build the parameter list 
#(the phi list is used for the algorithm starting values)
phi <- list(beta=matrix(c(3.65,0.046,-0.904),3,1),
			sigma2eps=0.1,
			sigma2omega=0.2,
			theta=0.01,
			G=matrix(0.77,1,1),
			Sigmaeta=matrix(0.3,1,1),
			m0=as.matrix(0),
			C0=as.matrix(1))

K <- matrix(1,ncol(z),1)

mod1 <- Stem.Model(z=z,covariates=covariates,
	coordinates=coordinates,phi=phi,K=K)
class(mod1)
is.Stem.Model(mod1)

#mod1 is given as output by the Stem.Model function
mod1.est <- Stem.Estimation(mod1)

#it is computer intensive
mod1.boot <- Stem.Bootstrap(StemModel=mod1.est, B=3)
names(mod1.boot)
#the first element of the output list
names(mod1.boot$boot.output[[1]])


#check if there is no convergence for some bootstrap iteration
B <- length(mod1.boot$boot.output)
n.null <- sum (unlist (lapply(mod1.boot$boot.output, 
function(x) length(x$StemModel)==1)) )
pos.null <- which((unlist (lapply(mod1.boot$boot.output, 
function(x) length(x$StemModel)==1)) ))
cat("------------B non null =", B - n.null,"\n")
if(length(pos.null)>0) boot1.mod = mod1.boot[-pos.null]

#put the bootstrap output in a matrix
npar <- length(unlist((mod1.boot$boot.output[[1]]$estimates$phi.hat)))-1
boot.estimates <- matrix(NA, nrow = (B - n.null), ncol = npar)

for(b in 1:(B - n.null)) {
phi.estimated <- mod1.boot$boot.output[[b]]$estimates$phi.hat
boot.estimates[b,] <-  c(phi.estimated$beta,
			phi.estimated$sigma2eps,
      		phi.estimated$sigma2omega,
			phi.estimated$theta,
      		phi.estimated$G,
			phi.estimated$Sigmaeta,
			phi.estimated$m0)
}

#compute the parameter standard errors
se <- sqrt(diag(var(na.omit(boot.estimates))))

#create a summary table with Estimates, Standard Errors (SE) and T-statistics.
phi.hat <- mod1.est$estimates$phi.hat
MLE <- c(phi.hat$beta, phi.hat$sigma2eps, phi.hat$sigma2omega,
phi.hat$theta, phi.hat$G, phi.hat$Sigmaeta,phi.hat$m0)
output1 <- cbind(MLE, se, MLE/se)
colnames(output1)<- c("Estimate", "SE", "T-stat.")
output1

#compute the 95% confidence intervals
IC <- matrix(NA,nrow=npar,ncol=2)
for(i in 1 : npar) {
      IC[i,] <- c(quantile(boot.estimates[,i],0.025),
quantile(boot.estimates[,i],0.975))
}


#create a summary table with Estimates, Standard Errors (SE) 
#and T-statistics and confidence intervals.
output2 <- cbind(output1,IC)
colnames(output2) <- c("Estimate", "SE", "T-stat.", "IC_inf", "IC_sup")
output2



