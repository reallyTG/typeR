library(TAM)


### Name: tam.fit
### Title: Item Infit and Outfit Statistic
### Aliases: tam.fit tam.mml.fit tam.jml.fit summary.tam.fit
### Keywords: Item fit Infit Outfit Fit statistics

### ** Examples

#############################################################################
# EXAMPLE 1: Dichotomous data data.sim.rasch
#############################################################################

data(data.sim.rasch)
# estimate Rasch model
mod1 <- TAM::tam.mml(resp=data.sim.rasch)
# item fit
fit1 <- TAM::tam.fit( mod1 )
summary(fit1)
  ##   > summary(fit1)
  ##      parameter Outfit Outfit_t Outfit_p Infit Infit_t Infit_p
  ##   1         I1  0.966   -0.409    0.171 0.996  -0.087   0.233
  ##   2         I2  1.044    0.599    0.137 1.029   0.798   0.106
  ##   3         I3  1.022    0.330    0.185 1.012   0.366   0.179
  ##   4         I4  1.047    0.720    0.118 1.054   1.650   0.025

#--------
# infit and oufit based on estimated WLEs
library(sirt)

# estimate WLE
wle <- TAM::tam.wle(mod1)
# extract item parameters
b1 <- - mod1$AXsi[, -1 ]
# assess item fit and person fit
fit1a <- sirt::pcm.fit(b=b1, theta=wle$theta, data.sim.rasch )
fit1a$item       # item fit statistic
fit1a$person     # person fit statistic

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Partial credit model data.gpcm
##D #############################################################################
##D 
##D data( data.gpcm )
##D dat <- data.gpcm
##D 
##D # estimate partial credit model in ConQuest parametrization 'item+item*step'
##D mod2 <- TAM::tam.mml( resp=dat, irtmodel="PCM2" )
##D summary(mod2)
##D # estimate item fit
##D fit2 <- TAM::tam.fit(mod2)
##D summary(fit2)
##D 
##D #=> The first three rows of the data frame correspond to the fit statistics
##D #     of first three items Comfort, Work and Benefit.
##D 
##D #--------
##D # infit and oufit based on estimated WLEs
##D # compute WLEs
##D wle <- TAM::tam.wle(mod2)
##D # extract item parameters
##D b1 <- - mod2$AXsi[, -1 ]
##D # assess fit
##D fit1a <- sirt::pcm.fit(b=b1, theta=wle$theta, dat)
##D fit1a$item
##D 
##D #############################################################################
##D # EXAMPLE 3: Fit statistic testing for local independence
##D #############################################################################
##D 
##D # generate data with local dependence and User-defined fit statistics
##D set.seed(4888)
##D I <- 40        # 40 items
##D N <- 1000       # 1000 persons
##D 
##D delta <- seq(-2,2, len=I)
##D theta <- stats::rnorm(N, 0, 1)
##D # simulate data
##D prob <- stats::plogis(outer(theta, delta, "-"))
##D rand <- matrix( stats::runif(N*I), nrow=N, ncol=I)
##D resp <- 1*(rand < prob)
##D colnames(resp) <- paste("I", 1:I, sep="")
##D 
##D #induce some local dependence
##D for (item in c(10, 20, 30)){
##D  #  20##D 
##D  #are made equal to the previous item
##D   row <- round( stats::runif(0.2*N)*N + 0.5)
##D   resp[row, item+1] <- resp[row, item]
##D }
##D 
##D #run TAM
##D mod1 <- TAM::tam.mml(resp)
##D 
##D #User-defined fit design matrix
##D F <- array(0, dim=c(dim(mod1$A)[1], dim(mod1$A)[2], 6))
##D F[,,1] <- mod1$A[,,10] + mod1$A[,,11]
##D F[,,2] <- mod1$A[,,12] + mod1$A[,,13]
##D F[,,3] <- mod1$A[,,20] + mod1$A[,,21]
##D F[,,4] <- mod1$A[,,22] + mod1$A[,,23]
##D F[,,5] <- mod1$A[,,30] + mod1$A[,,31]
##D F[,,6] <- mod1$A[,,32] + mod1$A[,,33]
##D fit <- TAM::tam.fit(mod1, FitMatrix=F)
##D summary(fit)
##D 
##D #############################################################################
##D # EXAMPLE 4: Fit statistic testing for items with differing slopes
##D #############################################################################
##D 
##D #*** simulate data
##D library(sirt)
##D set.seed(9875)
##D N <- 2000
##D I <- 20
##D b <- sample( seq( -2, 2, length=I ) )
##D a <- rep( 1, I )
##D # create some misfitting items
##D a[c(1,3)] <- c(.5, 1.5 )
##D # simulate data
##D dat <- sirt::sim.raschtype( rnorm(N), b=b, fixed.a=a )
##D #*** estimate Rasch model
##D mod1 <- TAM::tam.mml(resp=dat)
##D #*** assess item fit by infit and outfit statistic
##D fit1 <- TAM::tam.fit( mod1 )$itemfit
##D round( cbind( "b"=mod1$item$AXsi_.Cat1, fit1$itemfit[,-1] )[1:7,], 3 )
##D 
##D #*** compute item fit statistic in mirt package
##D library(mirt)
##D library(sirt)
##D mod1c <- mirt::mirt( dat, model=1, itemtype="Rasch", verbose=TRUE)
##D print(mod1c)                      # model summary
##D sirt::mirt.wrapper.coef(mod1c)    # estimated parameters
##D fit1c <- mirt::itemfit(mod1c, method="EAP")    # model fit in mirt package
##D # compare results of TAM and mirt
##D dfr <- cbind( "TAM"=fit1, "mirt"=fit1c[,-c(1:2)] )
##D 
##D # S-X2 item fit statistic (see also the output from mirt)
##D library(CDM)
##D sx2mod1 <- CDM::itemfit.sx2( mod1 )
##D summary(sx2mod1)
##D 
##D # compare results of CDM and mirt
##D sx2comp <-  cbind( sx2mod1$itemfit.stat[, c("S-X2", "p") ],
##D                     dfr[, c("mirt.S_X2", "mirt.p.S_X2") ] )
##D round(sx2comp, 3 )
## End(Not run)



