library(BART)


### Name: recur.bart
### Title: BART for recurrent events
### Aliases: recur.bart mc.recur.bart
### Keywords: nonparametric recurrent events model nonproportional hazards

### ** Examples


## load 20 percent random sample
data(xdm20.train)
data(xdm20.test)
data(ydm20.train)

##test BART with token run to ensure installation works
## with current technology even a token run will violate CRAN policy
## set.seed(99)
## post <- recur.bart(x.train=xdm20.train, y.train=ydm20.train,
##                    nskip=1, ndpost=1, keepevery=1)

## Not run: 
##D 
##D ## set.seed(99)
##D ## post <- recur.bart(x.train=xdm20.train, y.train=ydm20.train,
##D ##                    keeptrainfits=TRUE)
##D 
##D ## larger data sets can take some time so, if parallel processing
##D ## is available, submit this statement instead
##D post <- mc.recur.bart(x.train=xdm20.train, y.train=ydm20.train,
##D                       keeptrainfits=TRUE, mc.cores=8, seed=99)
##D 
##D require(rpart)
##D require(rpart.plot)
##D 
##D post$yhat.train.mean <- apply(post$yhat.train, 2, mean)
##D dss <- rpart(post$yhat.train.mean~xdm20.train)
##D 
##D rpart.plot(dss)
##D ## for the 20 percent sample, notice that the top splits
##D ## involve cci_pvd and n
##D ## for the full data set, notice that all splits
##D ## involve ca, cci_pud, cci_pvd, ins270 and n
##D ## (except one at the bottom involving a small group)
##D 
##D ## compare patients treated with insulin (ins270=1) vs
##D ## not treated with insulin (ins270=0)
##D N <- 50 ## 50 training patients and 50 validation patients
##D K <- post$K ## 798 unique time points
##D NK <- 50*K
##D 
##D ## only testing set, i.e., remove training set
##D xdm20.test. <- xdm20.test[NK+1:NK, post$rm.const]
##D xdm20.test. <- rbind(xdm20.test., xdm20.test.)
##D xdm20.test.[ , 'ins270'] <- rep(0:1, each=NK)
##D 
##D ## multiple threads will be utilized if available
##D pred <- predict(post, xdm20.test., mc.cores=8)
##D 
##D ## create Friedman's partial dependence function for the
##D ## relative intensity for ins270 by time
##D M <- nrow(pred$haz.test) ## number of MCMC samples
##D RI <- matrix(0, M, K)
##D for(j in 1:K) {
##D     h <- seq(j, NK, by=K)
##D     RI[ , j] <- apply(pred$haz.test[ , h+NK]/
##D                       pred$haz.test[ , h], 1, mean)
##D }
##D 
##D RI.lo <- apply(RI, 2, quantile, probs=0.025)
##D RI.mu <- apply(RI, 2, mean)
##D RI.hi <- apply(RI, 2, quantile, probs=0.975)
##D 
##D plot(post$times, RI.hi, type='l', lty=2, log='y',
##D      ylim=c(min(RI.lo, 1/RI.hi), max(1/RI.lo, RI.hi)),
##D      xlab='t', ylab='RI(t, x)',
##D      sub='insulin(ins270=1) vs. no insulin(ins270=0)',
##D      main='Relative intensity of hospital admissions for diabetics')
##D lines(post$times, RI.mu)
##D lines(post$times, RI.lo, lty=2)
##D lines(post$times, rep(1, K), col='darkgray')
##D 
##D ## RI for insulin therapy seems fairly constant with time
##D mean(RI.mu)
##D 
## End(Not run)



