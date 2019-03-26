library(sirt)


### Name: rasch.mirtlc
### Title: Multidimensional Latent Class 1PL and 2PL Model
### Aliases: rasch.mirtlc summary.rasch.mirtlc logLik.rasch.mirtlc
###   anova.rasch.mirtlc IRT.irfprob.rasch.mirtlc
###   IRT.likelihood.rasch.mirtlc IRT.posterior.rasch.mirtlc
###   IRT.modelfit.rasch.mirtlc summary.IRT.modelfit.rasch.mirtlc
### Keywords: Multidimensional latent class Rasch model summary

### ** Examples

#############################################################################
# EXAMPLE 1: Reading data
#############################################################################
data( data.read )
dat <- data.read

#***************
# latent class models

# latent class model with 1 class
mod1 <- sirt::rasch.mirtlc( dat, Nclasses=1 )
summary(mod1)

# latent class model with 2 classes
mod2 <- sirt::rasch.mirtlc( dat, Nclasses=2 )
summary(mod2)

## Not run: 
##D # latent class model with 3 classes
##D mod3 <- sirt::rasch.mirtlc( dat, Nclasses=3, seed=- 30)
##D summary(mod3)
##D 
##D # extract individual likelihood
##D lmod3 <- IRT.likelihood(mod3)
##D str(lmod3)
##D # extract likelihood value
##D logLik(mod3)
##D # extract item response functions
##D IRT.irfprob(mod3)
##D 
##D # compare models 1, 2 and 3
##D anova(mod2,mod3)
##D IRT.compareModels(mod1,mod2,mod3)
##D # avsolute and relative model fit
##D smod2 <- IRT.modelfit(mod2)
##D smod3 <- IRT.modelfit(mod3)
##D summary(smod2)
##D IRT.compareModels(smod2,smod3)
##D 
##D # latent class model with 4 classes and 3 starts with different seeds
##D mod4 <- sirt::rasch.mirtlc( dat, Nclasses=4,seed=-30,  nstarts=3 )
##D # display different solutions
##D sort(mod4$devL)
##D summary(mod4)
##D 
##D # latent class multiple group model
##D # define group identifier
##D group <- rep( 1, nrow(dat))
##D group[ 1:150 ] <- 2
##D mod5 <- sirt::rasch.mirtlc( dat, Nclasses=3, group=group )
##D summary(mod5)
##D 
##D #*************
##D # Unidimensional IRT models with ordered trait
##D 
##D # 1PL model with 3 classes
##D mod11 <- sirt::rasch.mirtlc( dat, Nclasses=3, modeltype="MLC1", mmliter=30)
##D summary(mod11)
##D 
##D # 1PL model with 11 classes
##D mod12 <- sirt::rasch.mirtlc( dat, Nclasses=11,modeltype="MLC1", mmliter=30)
##D summary(mod12)
##D 
##D # 1PL model with 11 classes and fixed specified theta values
##D mod13 <- sirt::rasch.mirtlc( dat,  modeltype="MLC1",
##D              theta.k=seq( -4, 4, len=11 ), mmliter=100)
##D summary(mod13)
##D 
##D # 1PL model with fixed theta values and normal distribution
##D mod14 <- sirt::rasch.mirtlc( dat,  modeltype="MLC1", mmliter=30,
##D              theta.k=seq( -4, 4, len=11 ), distribution.trait="normal")
##D summary(mod14)
##D 
##D # 1PL model with a smoothed trait distribution (up to 3 moments)
##D mod15 <- sirt::rasch.mirtlc( dat,  modeltype="MLC1", mmliter=30,
##D              theta.k=seq( -4, 4, len=11 ),  distribution.trait="smooth3")
##D summary(mod15)
##D 
##D # 2PL with 3 classes
##D mod16 <- sirt::rasch.mirtlc( dat, Nclasses=3, modeltype="MLC2", mmliter=30 )
##D summary(mod16)
##D 
##D # 2PL with fixed theta and smoothed distribution
##D mod17 <- sirt::rasch.mirtlc( dat, theta.k=seq(-4,4,len=12), mmliter=30,
##D              modeltype="MLC2", distribution.trait="smooth4"  )
##D summary(mod17)
##D 
##D # 1PL multiple group model with 8 classes
##D # define group identifier
##D group <- rep( 1, nrow(dat))
##D group[ 1:150 ] <- 2
##D mod21 <- sirt::rasch.mirtlc( dat, Nclasses=8, modeltype="MLC1", group=group )
##D summary(mod21)
##D 
##D #***************
##D # multidimensional latent class IRT models
##D 
##D # define vector of dimensions
##D dimensions <- rep( 1:3, each=4 )
##D 
##D # 3-dimensional model with 8 classes and seed 145
##D mod31 <- sirt::rasch.mirtlc( dat, Nclasses=8, mmliter=30,
##D              modeltype="MLC1", seed=145, dimensions=dimensions )
##D summary(mod31)
##D 
##D # try the model above with different starting values
##D mod31s <- sirt::rasch.mirtlc( dat, Nclasses=8,
##D              modeltype="MLC1", seed=-30, nstarts=30, dimensions=dimensions )
##D summary(mod31s)
##D 
##D # estimation with fixed theta vectors
##D #=> 4^3=216 classes
##D theta.k <- seq(-4, 4, len=6 )
##D theta.k <- as.matrix( expand.grid( theta.k, theta.k, theta.k ) )
##D mod32 <- sirt::rasch.mirtlc( dat,  dimensions=dimensions,
##D               theta.k=theta.k, modeltype="MLC1"  )
##D summary(mod32)
##D 
##D # 3-dimensional 2PL model
##D mod33 <- sirt::rasch.mirtlc( dat, dimensions=dimensions, theta.k=theta.k, modeltype="MLC2")
##D summary(mod33)
##D 
##D #############################################################################
##D # EXAMPLE 2: Skew trait distribution
##D #############################################################################
##D set.seed(789)
##D N <- 1000   # number of persons
##D I <- 20     # number of items
##D theta <- sqrt( exp( stats::rnorm( N ) ) )
##D theta <- theta - mean(theta )
##D # calculate skewness of theta distribution
##D mean( theta^3 ) / stats::sd(theta)^3
##D # simulate item responses
##D dat <- sirt::sim.raschtype( theta, b=seq(-2,2,len=I ) )
##D 
##D # normal distribution
##D mod1 <- sirt::rasch.mirtlc( dat, theta.k=seq(-4,4,len=15), modeltype="MLC1",
##D                distribution.trait="normal", mmliter=30)
##D 
##D # allow for skew distribution with smoothed distribution
##D mod2 <- sirt::rasch.mirtlc( dat, theta.k=seq(-4,4,len=15), modeltype="MLC1",
##D                distribution.trait="smooth3", mmliter=30)
##D 
##D # nonparametric distribution
##D mod3 <- sirt::rasch.mirtlc( dat, theta.k=seq(-4,4,len=15), modeltype="MLC1", mmliter=30)
##D 
##D summary(mod1)
##D summary(mod2)
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 3: Stouffer-Toby dataset data.si02 with 5 items
##D #############################################################################
##D 
##D data(dat.si02)
##D dat <- data.si02$data
##D weights <- data.si02$weights   # extract weights
##D 
##D # Model 1: 2 classes Rasch model
##D mod1 <- sirt::rasch.mirtlc( dat, Nclasses=2, modeltype="MLC1", weights=weights,
##D                  ref.item=4, nstarts=5)
##D summary(mod1)
##D 
##D # Model 2: 3 classes Rasch model: not all parameters are identified
##D mod2 <- sirt::rasch.mirtlc( dat, Nclasses=3, modeltype="MLC1", weights=weights,
##D                 ref.item=4, nstarts=5)
##D summary(mod2)
##D 
##D # Model 3: Latent class model with 2 classes
##D mod3 <- sirt::rasch.mirtlc( dat, Nclasses=2, modeltype="LC", weights=weights, nstarts=5)
##D summary(mod3)
##D 
##D # Model 4: Rasch model with normal distribution
##D mod4 <- sirt::rasch.mirtlc( dat,  modeltype="MLC1", weights=weights,
##D             theta.k=seq( -6, 6, len=21 ), distribution.trait="normal", ref.item=4)
##D summary(mod4)
## End(Not run)

#############################################################################
# EXAMPLE 4: 5 classes, 3 dimensions and 27 items
#############################################################################

set.seed(979)
I <- 9
N <- 5000
b <- seq( - 1.5, 1.5, len=I)
b <- rep(b,3)
# define class locations
theta.k <- c(-3.0, -4.1, -2.8, 1.7, 2.3, 1.8,
   0.2, 0.4, -0.1,   2.6, 0.1, -0.9, -1.1,-0.7, 0.9 )

Nclasses <- 5
theta.k0 <- theta.k <- matrix( theta.k, Nclasses, 3, byrow=TRUE )
pi.k <- c(.20,.25,.25,.10,.15)
theta <- theta.k[ rep( 1:Nclasses, round(N*pi.k) ), ]
dimensions <- rep( 1:3, each=I)
# simulate item responses
dat <- matrix( NA, nrow=N, ncol=I*3)
for (ii in 1:(3*I) ){
    dat[,ii] <- 1 * ( stats::runif(N) < stats::plogis( theta[,dimensions[ii]] - b[ii]))
}
colnames(dat) <- paste0( rep( LETTERS[1:3], each=I ), 1:(3*I) )

# estimate model
mod1 <- sirt::rasch.mirtlc( dat, Nclasses=Nclasses, dimensions=dimensions,
             modeltype="MLC1", ref.item=c(5,14,23), glob.conv=.0005, conv1=.0005)

round( cbind( mod1$theta.k, mod1$pi.k ), 3 )
  ##          [,1]   [,2]   [,3]  [,4]
  ##   [1,] -2.776 -3.791 -2.667 0.250
  ##   [2,] -0.989 -0.605  0.957 0.151
  ##   [3,]  0.332  0.418 -0.046 0.246
  ##   [4,]  2.601  0.171 -0.854 0.101
  ##   [5,]  1.791  2.330  1.844 0.252
cbind( theta.k, pi.k )
  ##                       pi.k
  ##   [1,] -3.0 -4.1 -2.8 0.20
  ##   [2,]  1.7  2.3  1.8 0.25
  ##   [3,]  0.2  0.4 -0.1 0.25
  ##   [4,]  2.6  0.1 -0.9 0.10
  ##   [5,] -1.1 -0.7  0.9 0.15

# plot class locations
plot( 1:3, mod1$theta.k[1,], xlim=c(1,3), ylim=c(-5,3), col=1, pch=1, type="n",
    axes=FALSE, xlab="Dimension", ylab="Location")
axis(1, 1:3 ) ;  axis(2) ; axis(4)
for (cc in 1:Nclasses){ # cc <- 1
    lines(1:3, mod1$theta.k[cc,], col=cc, lty=cc )
    points(1:3, mod1$theta.k[cc,], col=cc,  pch=cc )
}

## Not run: 
##D #------
##D # estimate model with gdm function in CDM package
##D library(CDM)
##D # define Q-matrix
##D Qmatrix <- matrix(0,3*I,3)
##D Qmatrix[ cbind( 1:(3*I), rep(1:3, each=I) ) ] <- 1
##D 
##D set.seed(9176)
##D # random starting values for theta locations
##D theta.k <- matrix( 2*stats::rnorm(5*3), 5, 3 )
##D colnames(theta.k) <- c("Dim1","Dim2","Dim3")
##D # try possibly different starting values
##D 
##D # estimate model in CDM
##D b.constraint  <- cbind( c(5,14,23), 1, 0 )
##D mod2 <- CDM::gdm( dat, theta.k=theta.k, b.constraint=b.constraint, skillspace="est",
##D                irtmodel="1PL",  Qmatrix=Qmatrix)
##D summary(mod2)
##D 
##D #------
##D # estimate model with MultiLCIRT package
##D miceadds::library_install("MultiLCIRT")
##D 
##D # define matrix to allocate each item to one dimension
##D multi1 <- matrix( 1:(3*I), nrow=3, byrow=TRUE )
##D # define reference items in item-dimension allocation matrix
##D multi1[ 1, c(1,5)  ] <- c(5,1)
##D multi1[ 2, c(10,14) - 9  ] <- c(14,9)
##D multi1[ 3, c(19,23) - 18 ] <- c(23,19)
##D 
##D # Rasch model with 5 latent classes (random start: start=1)
##D mod3 <- MultiLCIRT::est_multi_poly(S=dat,k=5,       # k=5 ability levels
##D                 start=1,link=1,multi=multi1,tol=10^-5,
##D                 output=TRUE, disp=TRUE, fort=TRUE)
##D # estimated location points and class probabilities in MultiLCIRT
##D cbind( t( mod3$Th ), mod3$piv )
##D # compare results with rasch.mirtlc
##D cbind( mod1$theta.k, mod1$pi.k )
##D # simulated data parameters
##D cbind( theta.k, pi.k )
##D 
##D #----
##D # estimate model with cutomized input in mirt
##D library(mirt)
##D #-- define Theta design matrix for 5 classes
##D Theta <- diag(5)
##D Theta <- cbind( Theta, Theta, Theta )
##D r1 <- rownames(Theta) <- paste0("C",1:5)
##D colnames(Theta) <- c( paste0(r1, "D1"), paste0(r1, "D2"), paste0(r1, "D3") )
##D   ##      C1D1 C2D1 C3D1 C4D1 C5D1 C1D2 C2D2 C3D2 C4D2 C5D2 C1D3 C2D3 C3D3 C4D3 C5D3
##D   ##   C1    1    0    0    0    0    1    0    0    0    0    1    0    0    0    0
##D   ##   C2    0    1    0    0    0    0    1    0    0    0    0    1    0    0    0
##D   ##   C3    0    0    1    0    0    0    0    1    0    0    0    0    1    0    0
##D   ##   C4    0    0    0    1    0    0    0    0    1    0    0    0    0    1    0
##D   ##   C5    0    0    0    0    1    0    0    0    0    1    0    0    0    0    1
##D #-- define mirt model
##D I <- ncol(dat)  # I=27
##D mirtmodel <- mirt::mirt.model("
##D         C1D1=1-9 \n C2D1=1-9 \n  C3D1=1-9 \n  C4D1=1-9  \n  C5D1=1-9
##D         C1D2=10-18 \n C2D2=10-18 \n  C3D2=10-18 \n  C4D2=10-18  \n  C5D2=10-18
##D         C1D3=19-27 \n C2D3=19-27 \n  C3D3=19-27 \n  C4D3=19-27  \n  C5D3=19-27
##D         CONSTRAIN=(1-9,a1),(1-9,a2),(1-9,a3),(1-9,a4),(1-9,a5),
##D                     (10-18,a6),(10-18,a7),(10-18,a8),(10-18,a9),(10-18,a10),
##D                     (19-27,a11),(19-27,a12),(19-27,a13),(19-27,a14),(19-27,a15)
##D                 ")
##D #-- get initial parameter values
##D mod.pars <- mirt::mirt(dat, model=mirtmodel,  pars="values")
##D #-- redefine initial parameter values
##D # set all d parameters initially to zero
##D ind <- which( ( mod.pars$name=="d" ) )
##D mod.pars[ ind,"value" ]  <- 0
##D # fix item difficulties of reference items to zero
##D mod.pars[ ind[ c(5,14,23) ], "est"] <- FALSE
##D mod.pars[ind,]
##D # initial item parameters of cluster locations (a1,...,a15)
##D ind <- which( ( mod.pars$name %in% paste0("a", c(1,6,11) ) ) & ( mod.pars$est ) )
##D mod.pars[ind,"value"] <- -2
##D ind <- which( ( mod.pars$name %in% paste0("a", c(1,6,11)+1 ) ) & ( mod.pars$est ) )
##D mod.pars[ind,"value"] <- -1
##D ind <- which( ( mod.pars$name %in% paste0("a", c(1,6,11)+2 ) ) & ( mod.pars$est ) )
##D mod.pars[ind,"value"] <- 0
##D ind <- which( ( mod.pars$name %in% paste0("a", c(1,6,11)+3 ) ) & ( mod.pars$est ) )
##D mod.pars[ind,"value"] <- 1
##D ind <- which( ( mod.pars$name %in% paste0("a", c(1,6,11)+4 ) ) & ( mod.pars$est ) )
##D mod.pars[ind,"value"] <- 0
##D #-- define prior for latent class analysis
##D lca_prior <- function(Theta,Etable){
##D   TP <- nrow(Theta)
##D   if ( is.null(Etable) ){ prior <- rep( 1/TP, TP ) }
##D   if ( ! is.null(Etable) ){
##D     prior <- ( rowSums(Etable[, seq(1,2*I,2)]) + rowSums(Etable[,seq(2,2*I,2)]) )/I
##D   }
##D   prior <- prior / sum(prior)
##D   return(prior)
##D }
##D 
##D #-- estimate model in mirt
##D mod4 <- mirt::mirt(dat, mirtmodel, pars=mod.pars, verbose=TRUE,
##D               technical=list( customTheta=Theta, customPriorFun=lca_prior,
##D                     MAXQUAD=1E20) )
##D # correct number of estimated parameters
##D mod4@nest <- as.integer(sum(mod.pars$est) + nrow(Theta)-1 )
##D # extract coefficients
##D # source.all(pfsirt)
##D cmod4 <- sirt::mirt.wrapper.coef(mod4)
##D 
##D # estimated item difficulties
##D dfr <- data.frame( "sim"=b, "mirt"=-cmod4$coef$d, "sirt"=mod1$item$thresh )
##D round( dfr, 4 )
##D   ##         sim    mirt    sirt
##D   ##   1  -1.500 -1.3782 -1.3382
##D   ##   2  -1.125 -1.0059 -0.9774
##D   ##   3  -0.750 -0.6157 -0.6016
##D   ##   4  -0.375 -0.2099 -0.2060
##D   ##   5   0.000  0.0000  0.0000
##D   ##   6   0.375  0.5085  0.4984
##D   ##   7   0.750  0.8661  0.8504
##D   ##   8   1.125  1.3079  1.2847
##D   ##   9   1.500  1.5891  1.5620
##D   ##   [...]
##D 
##D #-- reordering estimated latent clusters to make solutions comparable
##D #* extract estimated cluster locations from sirt
##D order.sirt <- c(1,5,3,4,2)  # sort(order.sirt)
##D round(mod1$trait[,1:3],3)
##D dfr <- data.frame( "sim"=theta.k, mod1$trait[order.sirt,1:3] )
##D colnames(dfr)[4:6] <- paste0("sirt",1:3)
##D #* extract estimated cluster locations from mirt
##D c4 <- cmod4$coef[, paste0("a",1:15) ]
##D c4 <- apply( c4,2, FUN=function(ll){ ll[ ll!=0 ][1] } )
##D trait.loc <- matrix(c4,5,3)
##D order.mirt <- c(1,4,3,5,2)  # sort(order.mirt)
##D dfr <- cbind( dfr, trait.loc[ order.mirt, ] )
##D colnames(dfr)[7:9] <- paste0("mirt",1:3)
##D # compare estimated cluster locations
##D round(dfr,3)
##D   ##     sim.1 sim.2 sim.3  sirt1  sirt2  sirt3  mirt1  mirt2  mirt3
##D   ##   1  -3.0  -4.1  -2.8 -2.776 -3.791 -2.667 -2.856 -4.023 -2.741
##D   ##   5   1.7   2.3   1.8  1.791  2.330  1.844  1.817  2.373  1.869
##D   ##   3   0.2   0.4  -0.1  0.332  0.418 -0.046  0.349  0.421 -0.051
##D   ##   4   2.6   0.1  -0.9  2.601  0.171 -0.854  2.695  0.166 -0.876
##D   ##   2  -1.1  -0.7   0.9 -0.989 -0.605  0.957 -1.009 -0.618  0.962
##D #* compare estimated cluster sizes
##D dfr <- data.frame( "sim"=pi.k, "sirt"=mod1$pi.k[order.sirt,1],
##D             "mirt"=mod4@Prior[[1]][ order.mirt] )
##D round(dfr,4)
##D   ##      sim   sirt   mirt
##D   ##   1 0.20 0.2502 0.2500
##D   ##   2 0.25 0.2522 0.2511
##D   ##   3 0.25 0.2458 0.2494
##D   ##   4 0.10 0.1011 0.0986
##D   ##   5 0.15 0.1507 0.1509
##D 
##D #############################################################################
##D # EXAMPLE 5: Dataset data.si04 from Bartolucci et al. (2012)
##D #############################################################################
##D 
##D data(data.si04)
##D 
##D # define reference items
##D ref.item <- c(7,17,25,44,64)
##D dimensions <- data.si04$itempars$dim
##D 
##D # estimate a Rasch latent class with 9 classes
##D mod1 <- sirt::rasch.mirtlc( data.si04$data, Nclasses=9, dimensions=dimensions,
##D              modeltype="MLC1", ref.item=ref.item, glob.conv=.005, conv1=.005,
##D              nstarts=1, mmliter=200 )
##D 
##D # compare estimated distribution with simulated distribution
##D round( cbind( mod1$theta.k, mod1$pi.k ), 4 ) # estimated
##D   ##            [,1]    [,2]    [,3]    [,4]    [,5]   [,6]
##D   ##    [1,] -3.6043 -5.1323 -5.3022 -6.8255 -4.3611 0.1341
##D   ##    [2,]  0.2083 -2.7422 -2.8754 -5.3416 -2.5085 0.1573
##D   ##    [3,] -2.8641 -4.0272 -5.0580 -0.0340 -0.9113 0.1163
##D   ##    [4,] -0.3575 -2.0081 -1.7431  1.2992 -0.1616 0.0751
##D   ##    [5,]  2.9329  0.3662 -1.6516 -3.0284  0.1844 0.1285
##D   ##    [6,]  1.5092 -2.0461 -4.3093  1.0481  1.0806 0.1094
##D   ##    [7,]  3.9899  3.1955 -4.0010  1.8879  2.2988 0.1460
##D   ##    [8,]  4.3062  0.7080 -1.2324  1.4351  2.0893 0.1332
##D   ##    [9,]  5.0855  4.1214 -0.9141  2.2744  1.5314 0.0000
##D 
##D round(d2,4) # simulated
##D   ##         class      A      B      C      D      E     pi
##D   ##    [1,]     1 -3.832 -5.399 -5.793 -7.042 -4.511 0.1323
##D   ##    [2,]     2 -2.899 -4.217 -5.310 -0.055 -0.915 0.1162
##D   ##    [3,]     3 -0.376 -2.137 -1.847  1.273 -0.078 0.0752
##D   ##    [4,]     4  0.208 -2.934 -3.011 -5.526 -2.511 0.1583
##D   ##    [5,]     5  1.536 -2.137 -4.606  1.045  1.143 0.1092
##D   ##    [6,]     6  2.042 -0.573 -0.404 -4.331 -1.044 0.0471
##D   ##    [7,]     7  3.853  0.841 -2.993 -2.746  0.803 0.0822
##D   ##    [8,]     8  4.204  3.296 -4.328  1.892  2.419 0.1453
##D   ##    [9,]     9  4.466  0.700 -1.334  1.439  2.161 0.1343
## End(Not run)



