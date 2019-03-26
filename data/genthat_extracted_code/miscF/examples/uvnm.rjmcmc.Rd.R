library(miscF)


### Name: uvnm.rjmcmc
### Title: Univariate Normal Mixture (UVNM) Model with Unknown Number of
###   Components
### Aliases: uvnm.rjmcmc
### Keywords: distribution

### ** Examples


## Not run: 
##D     require(mixAK)
##D     data(Acidity)
##D     y <- Acidity
##D     w <- c(0.50, 0.17, 0.33)
##D     mu <- c(4, 5, 6)
##D     sigma2 <- c(0.08, 0.10, 0.14)
##D     Z <- do.call(cbind, lapply(1:3, function(i)
##D                                     w[i]*dnorm(y, mu[i], sqrt(sigma2[i]))))
##D     Z <- apply(Z, 1, function(x) which(x==max(x))[1])
##D      
##D     result <- uvnm.rjmcmc(y, nsweep=200000, kmax=30, k=3,
##D                           w, mu, sigma2, Z)
##D 
##D     ksave <- result$k.save
##D     round(table(ksave[-(1:100000)])/100000,4)
##D 
##D     #conditional density estimation
##D     focus.k <- 3
##D     pick.k <- which(ksave==focus.k)
##D     w <- unlist(result$w.save[pick.k])
##D     mu <- unlist(result$mu.save[pick.k])
##D     sigma2 <- unlist(result$sigma2.save[pick.k])
##D     den.estimate <- rep(w, each=length(y)) *
##D                     dnorm(rep(y, length(w)), mean=rep(mu, each=length(y)),
##D                           sd=rep(sqrt(sigma2), each=length(y)))
##D     den.estimate <- rowMeans(matrix(den.estimate, nrow=length(y)))*focus.k
##D 
##D     #within-sample classification
##D     class <- apply(result$Z.save[,pick.k], 1,
##D                                 function(x) c(sum(x==1), sum(x==2), sum(x==3)))
##D     class <- max.col(t(class))
##D 
##D     #visualize the results
##D     hist(y, freq=FALSE, breaks=20, axes=FALSE, ylim=c(-0.3, 1),
##D          main="Density Estimation and Classification", ylab="")
##D     axis(2, at=c(-(3:1)/10, seq(0,10,2)/10), labels=c(3:1, seq(0,10,2)/10),
##D          font=2)
##D     lines(sort(y), den.estimate[order(y)], col="red")
##D     for(i in 1:3){
##D         points(y[class==i], rep(-i/10, length(y[class==i])), col=i, pch=i)
##D     }
##D     mtext("Density", 2, at=0.5, line=2)
##D     mtext("Classification", 2, at=-0.15, line=2)
## End(Not run)



