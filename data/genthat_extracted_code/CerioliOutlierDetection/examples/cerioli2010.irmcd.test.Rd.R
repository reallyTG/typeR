library(CerioliOutlierDetection)


### Name: cerioli2010.irmcd.test
### Title: Iterated RMCD test of Cerioli (2010)
### Aliases: cerioli2010.irmcd.test
### Keywords: robust multivariate htest

### ** Examples

require(mvtnorm, quiet=TRUE)

############################################
# dimension v, number of observations n
v <- 5
n <- 200
simdata <- array( rmvnorm(n*v, mean=rep(0,v), 
    sigma = diag(rep(1,v))), c(n,v) )
# detect outliers
results <- cerioli2010.irmcd.test( simdata, 
    signif.gamma=c(0.05,0.01,0.001) )
# count number of outliers detected for each 
# significance level
colSums( results$outliers )


#############################################
# add some contamination to illustrate how to 
# detect outliers using the irmcd test
# 10/200 = 5% contamination
simdata[ sample(n,10), ] <- array( 
  rmvnorm( 10*v, mean=rep(2,v), sigma = diag(rep(1,v))),
  c(10,v)
)
results <- cerioli2010.irmcd.test( simdata, 
  signif.gamma=0.01 )
mean( results$outliers[,1,drop=TRUE] )

#############################################
# banknote example from Cerioli (2010)
## Not run: 
##D 
##D   require(rrcov) # for CovMcd
##D   require(alr3)  # banknote data set lives here
##D   data(banknote, package="alr3")
##D   # length, width of left edge, width of right edge,
##D   # width of bottom edge, width of top edge, length
##D   # of image diagonal, counterfeit (1=counterfeit)
##D 
##D   bnk.gamma <- 0.01
##D   # genuine banknotes
##D   # classical mean and covariance
##D   banknote.real <- banknote[ banknote[,"Y"]==0, 1:6 ]
##D   cov.cls <- CovClassic( banknote.real  )
##D   # 1 - (1 - 0.01)^(1/100) quantile of scaled-Beta distribution
##D   # with m=100 and v=6
##D   bnk.m <- nrow( banknote.real )
##D   bnk.v <- ncol( banknote.real ) 
##D   bnk.alpha <- 1. - ((1. - bnk.gamma)^(1./bnk.m))
##D   cutoff.cls <- (bnk.m-1.)*(bnk.m-1.)*qbeta( 1. - bnk.alpha, bnk.v/2., 
##D   (bnk.m - bnk.v - 1.)/2.)/bnk.m
##D   # Figure 4 (left) in Cerioli (2010)
##D   plot( getDistance( cov.cls ), xlab="Index number", 
##D   ylab="Squared Mahalanobis Distance", type="p", 
##D   ylim=c(0,45)
##D   )
##D   abline( h=cutoff.cls )
##D 
##D   # reweighted MCD, maximum breakdown point case
##D   cov.rob <- CovMcd( banknote.real, 
##D   alpha=floor((bnk.m + bnk.v + 1.)/2.)/bnk.m, nsamp="best" )
##D   # cutoff using chi-squared individually
##D   cutoff.rmcdind <- qchisq(1. - bnk.gamma, df=bnk.v)
##D   # cufoff using simultaneous chi-square
##D   cutoff.rmcdsim <- qchisq(1. - bnk.alpha, df=bnk.v)
##D   # scaled-F cutoff using FSRMCD
##D   # cutoff value is returned by critvalfcn for observations
##D   # with weight=0
##D   tmp.fsrmcd <- cerioli2010.fsrmcd.test( banknote.real, 
##D   signif.alpha=bnk.alpha )
##D   cutoff.fsrmcd <- unique(tmp.fsrmcd$critvalfcn( bnk.alpha )[tmp.fsrmcd$weights==0])
##D   # Figure 4 (right)
##D   plot( getDistance( cov.rob ), xlab="Index number",
##D   ylab="Squared Robust Reweighted Distance", type="p",
##D   ylim=c(0,45)
##D   )
##D   abline( h=cutoff.rmcdind, lty="dotted" )
##D   abline( h=cutoff.rmcdsim, lty="dashed" )
##D   abline( h=cutoff.fsrmcd, lty="solid" )
##D   legend( "topright", c("RMCD_ind","RMCD","FSRMCD"), 
##D     lty=c("dotted","dashed","solid") )
##D 
##D   # forged banknotes
##D   # classical mean and covariance
##D   banknote.fake <- banknote[ banknote[,"Y"]==1, 1:6 ]
##D   cov.cls <- CovClassic( banknote.fake  )
##D   # 1 - (1 - 0.01)^(1/100) quantile of scaled-Beta distribution
##D   # with m=100 and v=6
##D   bnk.m <- nrow( banknote.fake )
##D   bnk.v <- ncol( banknote.fake ) 
##D   bnk.alpha <- 1. - ((1. - bnk.gamma)^(1./bnk.m))
##D   cutoff.cls <- (bnk.m-1.)*(bnk.m-1.)*qbeta( 1. - bnk.alpha, bnk.v/2., 
##D     (bnk.m - bnk.v - 1.)/2.)/bnk.m
##D   # Figure 5 (left) in Cerioli (2010)
##D   plot( getDistance( cov.cls ), xlab="Index number", 
##D     ylab="Squared Mahalanobis Distance", type="p", 
##D     ylim=c(0,45)
##D   )
##D   abline( h=cutoff.cls )
##D   
##D   
##D   # reweighted MCD, maximum breakdown point case
##D   cov.rob <- CovMcd( banknote.fake, 
##D     alpha=floor((bnk.m + bnk.v + 1.)/2.)/bnk.m, nsamp="best" )
##D   # cutoff using chi-squared individually
##D   cutoff.rmcdind <- qchisq(1. - bnk.gamma, df=bnk.v)
##D   # scaled-F cutoff using FSRMCD
##D   # cutoff value is returned by critvalfcn for observations
##D   # with weight=0
##D   tmp.fsrmcd <- cerioli2010.fsrmcd.test( banknote.fake, 
##D     signif.alpha=bnk.alpha )
##D   cutoff.fsrmcd <- unique(tmp.fsrmcd$critvalfcn( bnk.alpha )[tmp.fsrmcd$weights==0])
##D   cutoff.irmcd <- unique(tmp.fsrmcd$critvalfcn( bnk.gamma )[tmp.fsrmcd$weights==0])
##D   # Figure 5 (right) in Cerioli (2010)
##D   plot( getDistance( cov.rob ), xlab="Index number",
##D     ylab="Squared robust reweighted Distance", type="p",
##D     ylim=c(0,150)
##D   )
##D   abline( h=cutoff.rmcdind, lty="dotted" )
##D   abline( h=cutoff.fsrmcd, lty="dashed" )
##D   abline( h=cutoff.irmcd, lty="solid" )
##D   legend( "topright", c("RMCD_ind","FSRMCD","IRMCD"), 
##D     lty=c("dotted","dashed","solid") )
##D 
## End(Not run)

#############################################
# example of how to ensure the size of the intersection test is correct
## Not run: 
##D   n.sim <- 5000
##D   simdata <- array( 
##D     rmvnorm(n*v*n.sim, mean=rep(0,v), sigma=diag(rep(1,v))),
##D     c(n,v,n.sim)
##D   )
##D   # in practice we'd do this using one of the parallel processing
##D   # methods out there
##D   results <- apply( simdata, 3, function(dm) {
##D     z <- cerioli2010.irmcd.test( dm, 
##D       signif.gamma=0.01 )
##D     # true if outliers were detected in the data, false otherwise
##D     any(z$outliers[,1,drop=TRUE])
##D   })
##D   # count the percentage of samples where outliers were detected;
##D   # should be close to the significance level value used (0.01) in these
##D   # samples for the intersection test
##D   mean(results)
## End(Not run)



