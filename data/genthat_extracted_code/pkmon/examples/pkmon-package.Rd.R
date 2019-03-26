library(pkmon)


### Name: pkmon-package
### Title: Least-squares estimator under k-monotony constraint for discrete
###   functions
### Aliases: pkmon-package pkmon
### Keywords: package

### ** Examples


####################
# Example 1
# one triangular function T_j=Q_j^2, for j=supp=20 and for k=2 and k=3
n=30;
k1=2;
k2=3;
l=2;
supp=20;
p=dSpline(supp, k=l);
X=rSpline(n=n, supp, k=l);
ptilde=pEmp(X);
phat1=pMonotone(ptilde$freq, k=k1);
phat2=pMonotone(ptilde$freq, k=k2);

x.limits=c(0, max(supp+1, phat1$Spi+1, phat2$Spi+1));
y.limits=range(p, ptilde$freq, phat1$p, phat2$p);

plot(NULL, xlim=x.limits, ylim=y.limits, xlab="Counts", ylab="Frequencies");
points(0:supp, p, pch=16, col=1, lwd=2); 
points(ptilde$supp, ptilde$freq, pch=4, col=2, lwd=2);
points(0:max(phat1$Spi), phat1$p, pch=8, col=3, lwd=2);
points(0:max(phat2$Spi), phat2$p, pch=2, col=4, lwd=2);
legend("topright", pch=c(16, 4, 8, 2), col=c(1, 2, 3, 4),
	legend=c("p", expression(tilde("p")), expression(hat("p")*" - k = 2"), 
	expression(hat("p")*" - k = 3")));

####################
# Example 2
# mixture of 3 splines Q_j^3 and for k=4 and k=3
n=30;
k1=4;
k2=3;
l=3;
supp=c(5, 10, 20);
prob=c(0.5, 0.3, 0.2);
p=dmixSpline(supp, k=l, prob=prob);
X=rmixSpline(n=n, supp, k=l, prob=prob);
ptilde=pEmp(X);
phat1=pMonotone(ptilde$freq, k=k1);
phat2=pMonotone(ptilde$freq, k=k2);

x.limits=c(0, max(supp+1, phat1$Spi+1, phat2$Spi+1));
y.limits=range(p, ptilde$freq, phat1$p, phat2$p);

plot(NULL, xlim=x.limits, ylim=y.limits, xlab="Counts", ylab="Frequencies");
points(0:max(supp), p, pch=16, col=1, lwd=2); 
points(ptilde$supp, ptilde$freq, pch=4, col=2, lwd=2);
points(0:max(phat1$Spi), phat1$p, pch=8, col=3, lwd=2);
points(0:max(phat2$Spi), phat2$p, pch=2, col=4, lwd=2);
legend("topright", pch=c(16, 4, 8, 2), col=c(1, 2, 3, 4),
	legend=c("p", expression(tilde("p")), expression(hat(p)* " - k = 4"), 
	expression(hat(p)* " - k = 3")));

####################
# Example 3
# Poisson density
n=30;
k1=2;
k2=3;
supp=10;
p=dpois(0:supp, lambda=1);
X=rpois(n, lambda=1);
ptilde=pEmp(X);
phat1=pMonotone(ptilde$freq, k=k1);
phat2=pMonotone(ptilde$freq, k=k2);

x.limits=c(0, max(supp, phat1$Spi+1, phat2$Spi+1));
y.limits=range(p, ptilde$freq, phat1$p, phat2$p);

plot(NULL, xlim=x.limits, ylim=y.limits, xlab="Counts", ylab="Frequencies");
points(0:max(supp), p, pch=16, col=1, lwd=2);
points(ptilde$supp, ptilde$freq, pch=4, col=2, lwd=2);
points(0:max(phat1$Spi), phat1$p, pch=8, col=3, lwd=2);
points(0:max(phat2$Spi), phat2$p, pch=2, col=4, lwd=2);
legend("topright", pch=c(16, 4, 8, 2), col=c(1, 2, 3, 4),
       legend=c("p", expression(tilde("p")), expression(hat(p)* " - k = 2"),
                expression(hat(p)* " - k = 3")));

## Not run: 
##D ####################
##D # Simulation for comparing ptilde and pHat (p is 3-monotone, k=3)
##D #
##D #OUTPUT
##D #
##D # cvge : percentage of non-convergence of the algorithm
##D # r.emp : L2-risk for the empirical estimator
##D # r.Hat : L2-risk for the estimator under k-monotony constraint
##D 
##D 
##D nSim=500;
##D 
##D n=30;
##D k=3;
##D l=3;
##D supp=20;
##D p=dSpline(supp, k=l);
##D 
##D result <- matrix(nrow=nSim,ncol=3);
##D dimnames(result)[[2]] <- c("cvge","r.emp","r.Hat");
##D for (i in 1:nSim) {
##D   X=rSpline(n=n, supp, k=l);
##D   ptilde=pEmp(X);
##D   phat=pMonotone(ptilde$freq, k=k);
##D   m <- max(supp+1,length(ptilde$freq)+1,phat$Spi+1)
##D   pV=c(p,rep(0,m-length(p)))
##D   pHat=c(phat$p,rep(0,m-length(phat$p)))
##D   ptilde=c(ptilde$freq,rep(0,m-length(ptilde$freq)))
##D   result[i,] <- c(phat$cvge,sum((pV-ptilde)**2),
##D                   sum((pV-pHat)**2))
##D }
##D 
##D apply(result,2,mean)
##D 
##D #Example with set.seed(0)
##D #cvge       r.emp       r.Hat 
##D #0.000000000 0.030682552 0.004984899
## End(Not run)



