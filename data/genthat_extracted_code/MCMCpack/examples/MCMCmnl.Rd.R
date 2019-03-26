library(MCMCpack)


### Name: MCMCmnl
### Title: Markov Chain Monte Carlo for Multinomial Logistic Regression
### Aliases: MCMCmnl
### Keywords: models

### ** Examples


  ## Not run: 
##D   data(Nethvote)
##D 
##D   ## just a choice-specific X var
##D   post1 <- MCMCmnl(vote ~
##D                 choicevar(distD66, "sqdist", "D66") +
##D                 choicevar(distPvdA, "sqdist", "PvdA") +
##D                 choicevar(distVVD, "sqdist", "VVD") +
##D                 choicevar(distCDA, "sqdist", "CDA"),
##D                 baseline="D66", mcmc.method="IndMH", B0=0,
##D                 verbose=500, mcmc=100000, thin=10, tune=1.0,
##D                 data=Nethvote)
##D 
##D   plot(post1)
##D   summary(post1)
##D 
##D 
##D 
##D   ## just individual-specific X vars
##D   post2<- MCMCmnl(vote ~
##D                 relig + class + income + educ + age + urban,
##D                 baseline="D66", mcmc.method="IndMH", B0=0,
##D                 verbose=500, mcmc=100000, thin=10, tune=0.5,
##D                 data=Nethvote)
##D 
##D   plot(post2)
##D   summary(post2)
##D 
##D 
##D 
##D   ## both choice-specific and individual-specific X vars
##D   post3 <- MCMCmnl(vote ~
##D                 choicevar(distD66, "sqdist", "D66") +
##D                 choicevar(distPvdA, "sqdist", "PvdA") +
##D                 choicevar(distVVD, "sqdist", "VVD") +
##D                 choicevar(distCDA, "sqdist", "CDA") +
##D                 relig + class + income + educ + age + urban,
##D                 baseline="D66", mcmc.method="IndMH", B0=0,
##D                 verbose=500, mcmc=100000, thin=10, tune=0.5,
##D                 data=Nethvote)
##D 
##D   plot(post3)
##D   summary(post3)
##D 
##D 
##D   ## numeric y variable
##D   nethvote$vote <- as.numeric(nethvote$vote)
##D   post4 <- MCMCmnl(vote ~
##D                 choicevar(distD66, "sqdist", "2") +
##D                 choicevar(distPvdA, "sqdist", "3") +
##D                 choicevar(distVVD, "sqdist", "4") +
##D                 choicevar(distCDA, "sqdist", "1") +
##D                 relig + class + income + educ + age + urban,
##D                 baseline="2", mcmc.method="IndMH", B0=0,
##D                 verbose=500, mcmc=100000, thin=10, tune=0.5,
##D                 data=Nethvote)
##D 
##D 
##D   plot(post4)
##D   summary(post4)
##D 
##D 
##D 
##D   ## Simulated data example with nonconstant choiceset
##D   n <- 1000
##D   y <- matrix(0, n, 4)
##D   colnames(y) <- c("a", "b", "c", "d")
##D   xa <- rnorm(n)
##D   xb <- rnorm(n)
##D   xc <- rnorm(n)
##D   xd <- rnorm(n)
##D   xchoice <- cbind(xa, xb, xc, xd)
##D   z <- rnorm(n)
##D   for (i in 1:n){
##D     ## randomly determine choiceset (c is always in choiceset)
##D     choiceset <- c(3, sample(c(1,2,4), 2, replace=FALSE))
##D     numer <- matrix(0, 4, 1)
##D     for (j in choiceset){
##D       if (j == 3){
##D         numer[j] <- exp(xchoice[i, j] )
##D       }
##D       else {
##D         numer[j] <- exp(xchoice[i, j] - z[i] )
##D       }
##D     }
##D     p <- numer / sum(numer)
##D     y[i,] <- rmultinom(1, 1, p)
##D     y[i,-choiceset] <- -999
##D   }
##D 
##D   post5 <- MCMCmnl(y~choicevar(xa, "x", "a") +
##D                   choicevar(xb, "x", "b") +
##D                   choicevar(xc, "x", "c") +
##D                   choicevar(xd, "x", "d") + z,
##D                   baseline="c", verbose=500,
##D                   mcmc=100000, thin=10, tune=.85)
##D 
##D   plot(post5)
##D   summary(post5)
##D 
##D   
## End(Not run)




