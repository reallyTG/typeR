library(sirt)


### Name: rasch.copula2
### Title: Multidimensional IRT Copula Model
### Aliases: rasch.copula2 rasch.copula3 summary.rasch.copula2
###   summary.rasch.copula3 anova.rasch.copula2 anova.rasch.copula3
###   logLik.rasch.copula2 logLik.rasch.copula3
###   IRT.likelihood.rasch.copula2 IRT.likelihood.rasch.copula3
###   IRT.posterior.rasch.copula2 IRT.posterior.rasch.copula3
### Keywords: IRT copula models Local dependence summary logLik anova

### ** Examples

#############################################################################
# EXAMPLE 1: Reading Data
#############################################################################

data(data.read)
dat <- data.read

# define item clusters
itemcluster <- rep( 1:3, each=4 )

# estimate Copula model
mod1 <- sirt::rasch.copula2( dat=dat, itemcluster=itemcluster)

# estimate Rasch model
mod2 <- sirt::rasch.copula2( dat=dat, itemcluster=itemcluster,
        delta=rep(0,3), est.delta=rep(0,3 ) )
summary(mod1)
summary(mod2)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: 11 items nested within 2 item clusters (testlets)
##D #    with 2 resp. 3 dependent and 6 independent items
##D #############################################################################
##D 
##D set.seed(5698)
##D I <- 11                             # number of items
##D n <- 3000                           # number of persons
##D b <- seq(-2,2, len=I)               # item difficulties
##D theta <- stats::rnorm( n, sd=1 ) # person abilities
##D # define item clusters
##D itemcluster <- rep(0,I)
##D itemcluster[ c(3,5 )] <- 1
##D itemcluster[c(2,4,9)] <- 2
##D # residual correlations
##D rho <- c( .7, .5 )
##D 
##D # simulate data
##D dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
##D colnames(dat) <- paste("I", seq(1,ncol(dat)), sep="")
##D 
##D # estimate Rasch copula model
##D mod1 <- sirt::rasch.copula2( dat, itemcluster=itemcluster )
##D summary(mod1)
##D 
##D # both item clusters have Cook-Johnson copula as dependency
##D mod1c <- sirt::rasch.copula2( dat, itemcluster=itemcluster,
##D             copula.type="cook.johnson")
##D summary(mod1c)
##D 
##D # first item boundary mixture and second item Cook-Johnson copula
##D mod1d <- sirt::rasch.copula2( dat, itemcluster=itemcluster,
##D             copula.type=c( "bound.mixt", "cook.johnson" ) )
##D summary(mod1d)
##D 
##D # compare result with Rasch model estimation in rasch.copula2
##D # delta must be set to zero
##D mod2 <- sirt::rasch.copula2( dat, itemcluster=itemcluster, delta=c(0,0),
##D             est.delta=c(0,0) )
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 3: 12 items nested within 3 item clusters (testlets)
##D #   Cluster 1 -> Items 1-4; Cluster 2 -> Items 6-9;  Cluster 3 -> Items 10-12
##D #############################################################################
##D 
##D set.seed(967)
##D I <- 12                             # number of items
##D n <- 450                            # number of persons
##D b <- seq(-2,2, len=I)               # item difficulties
##D b <- sample(b)                      # sample item difficulties
##D theta <- stats::rnorm( n, sd=1 ) # person abilities
##D # itemcluster
##D itemcluster <- rep(0,I)
##D itemcluster[ 1:4 ] <- 1
##D itemcluster[ 6:9 ] <- 2
##D itemcluster[ 10:12 ] <- 3
##D # residual correlations
##D rho <- c( .35, .25, .30 )
##D 
##D # simulate data
##D dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
##D colnames(dat) <- paste("I", seq(1,ncol(dat)), sep="")
##D 
##D # estimate Rasch copula model
##D mod1 <- sirt::rasch.copula2( dat, itemcluster=itemcluster )
##D summary(mod1)
##D 
##D # person parameter estimation assuming the Rasch copula model
##D pmod1 <- sirt::person.parameter.rasch.copula(raschcopula.object=mod1 )
##D 
##D # Rasch model estimation
##D mod2 <- sirt::rasch.copula2( dat, itemcluster=itemcluster,
##D              delta=rep(0,3), est.delta=rep(0,3) )
##D summary(mod1)
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 4: Two-dimensional copula model
##D #############################################################################
##D 
##D set.seed(5698)
##D I <- 9
##D n <- 1500                           # number of persons
##D b <- seq(-2,2, len=I)               # item difficulties
##D theta0 <- stats::rnorm( n, sd=sqrt( .6 ) )
##D 
##D #*** Dimension 1
##D theta <- theta0 + stats::rnorm( n, sd=sqrt( .4 ) )   # person abilities
##D # itemcluster
##D itemcluster <- rep(0,I)
##D itemcluster[ c(3,5 )] <- 1
##D itemcluster[c(2,4,9)] <- 2
##D itemcluster1 <- itemcluster
##D # residual correlations
##D rho <- c( .7, .5 )
##D # simulate data
##D dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
##D colnames(dat) <- paste("A", seq(1,ncol(dat)), sep="")
##D dat1 <- dat
##D # estimate model of dimension 1
##D mod0a <- sirt::rasch.copula2( dat1, itemcluster=itemcluster1)
##D summary(mod0a)
##D 
##D #*** Dimension 2
##D theta <- theta0 + stats::rnorm( n, sd=sqrt( .8 ) )        # person abilities
##D # itemcluster
##D itemcluster <- rep(0,I)
##D itemcluster[ c(3,7,8 )] <- 1
##D itemcluster[c(4,6)] <- 2
##D itemcluster2 <- itemcluster
##D # residual correlations
##D rho <- c( .2, .4 )
##D # simulate data
##D dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
##D colnames(dat) <- paste("B", seq(1,ncol(dat)), sep="")
##D dat2 <- dat
##D # estimate model of dimension 2
##D mod0b <- sirt::rasch.copula2( dat2, itemcluster=itemcluster2)
##D summary(mod0b)
##D 
##D # both dimensions
##D dat <- cbind( dat1, dat2 )
##D itemcluster2 <- ifelse( itemcluster2 > 0, itemcluster2 +2, 0 )
##D itemcluster <- c( itemcluster1, itemcluster2 )
##D dims <- rep( 1:2, each=I)
##D 
##D # estimate two-dimensional copula model
##D mod1 <- sirt::rasch.copula3( dat, itemcluster=itemcluster, dims=dims, est.a=dims,
##D             theta.k=seq(-5,5,len=15) )
##D summary(mod1)
##D 
##D #############################################################################
##D # EXAMPLE 5: Subset of data Example 2
##D #############################################################################
##D 
##D set.seed(5698)
##D I <- 11                             # number of items
##D n <- 3000                           # number of persons
##D b <- seq(-2,2, len=I)               # item difficulties
##D theta <- stats::rnorm( n, sd=1.3 )  # person abilities
##D # define item clusters
##D itemcluster <- rep(0,I)
##D itemcluster[ c(3,5)] <- 1
##D itemcluster[c(2,4,9)] <- 2
##D # residual correlations
##D rho <- c( .7, .5 )
##D # simulate data
##D dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
##D colnames(dat) <- paste("I", seq(1,ncol(dat)), sep="")
##D 
##D # select subdataset with only one dependent item cluster
##D item.sel <- scan( what="character", nlines=1 )
##D     I1 I6 I7 I8 I10 I11 I3 I5
##D dat1 <- dat[,item.sel]
##D 
##D #******************
##D #*** Model 1a: estimate Copula model in sirt
##D itemcluster <- rep(0,8)
##D itemcluster[c(7,8)] <- 1
##D mod1a <- sirt::rasch.copula2( dat3, itemcluster=itemcluster )
##D summary(mod1a)
##D 
##D #******************
##D #*** Model 1b: estimate Copula model in mirt
##D library(mirt)
##D #*** redefine dataset for estimation in mirt
##D dat2 <- dat1[, itemcluster==0 ]
##D dat2 <- as.data.frame(dat2)
##D # combine items 3 and 5
##D dat2$C35 <- dat1[,"I3"] + 2*dat1[,"I5"]
##D table( dat2$C35, paste0( dat1[,"I3"],dat1[,"I5"]) )
##D #* define mirt model
##D mirtmodel <- mirt::mirt.model("
##D       F=1-7
##D       CONSTRAIN=(1-7,a1)
##D       " )
##D #-- Copula function with two dependent items
##D # define item category function for pseudo-items like C35
##D P.copula2 <- function(par,Theta, ncat){
##D      b1 <- par[1]
##D      b2 <- par[2]
##D      a1 <- par[3]
##D      ldelta <- par[4]
##D      P1 <- stats::plogis( a1*(Theta - b1 ) )
##D      P2 <- stats::plogis( a1*(Theta - b2 ) )
##D      Q1 <- 1-P1
##D      Q2 <- 1-P2
##D      # define vector-wise minimum function
##D      minf2 <- function( x1, x2 ){
##D          ifelse( x1 < x2, x1, x2 )
##D                                 }
##D      # distribution under independence
##D      F00 <- Q1*Q2
##D      F10 <- Q1*Q2 + P1*Q2
##D      F01 <- Q1*Q2 + Q1*P2
##D      F11 <- 1+0*Q1
##D      F_ind <- c(F00,F10,F01,F11)
##D      # distribution under maximal dependence
##D      F00 <- minf2(Q1,Q2)
##D      F10 <- Q2              #=minf2(1,Q2)
##D      F01 <- Q1              #=minf2(Q1,1)
##D      F11 <- 1+0*Q1          #=minf2(1,1)
##D      F_dep <- c(F00,F10,F01,F11)
##D      # compute mixture distribution
##D      delta <- stats::plogis(ldelta)
##D      F_tot <- (1-delta)*F_ind + delta * F_dep
##D      # recalculate probabilities of mixture distribution
##D      L1 <- length(Q1)
##D      v1 <- 1:L1
##D      F00 <- F_tot[v1]
##D      F10 <- F_tot[v1+L1]
##D      F01 <- F_tot[v1+2*L1]
##D      F11 <- F_tot[v1+3*L1]
##D      P00 <- F00
##D      P10 <- F10 - F00
##D      P01 <- F01 - F00
##D      P11 <- 1 - F10 - F01 + F00
##D      prob_tot <- c( P00, P10, P01, P11 )
##D      return(prob_tot)
##D         }
##D # create item
##D copula2 <- mirt::createItem(name="copula2", par=c(b1=0, b2=0.2, a1=1, ldelta=0),
##D                 est=c(TRUE,TRUE,TRUE,TRUE), P=P.copula2,
##D                 lbound=c(-Inf,-Inf,0,-Inf), ubound=c(Inf,Inf,Inf,Inf) )
##D # define item types
##D itemtype <- c( rep("2PL",6), "copula2" )
##D customItems <- list("copula2"=copula2)
##D # parameter table
##D mod.pars <- mirt::mirt(dat2, 1, itemtype=itemtype,
##D                 customItems=customItems, pars='values')
##D # estimate model
##D mod1b <- mirt::mirt(dat2, mirtmodel, itemtype=itemtype, customItems=customItems,
##D                 verbose=TRUE, pars=mod.pars,
##D                 technical=list(customTheta=as.matrix(seq(-4,4,len=21)) ) )
##D # estimated coefficients
##D cmod <- sirt::mirt.wrapper.coef(mod)$coef
##D 
##D # compare common item discrimination
##D round( c("sirt"=mod1a$item$a[1], "mirt"=cmod$a1[1] ), 4 )
##D   ##     sirt   mirt
##D   ##   1.2845 1.2862
##D # compare delta parameter
##D round( c("sirt"=mod1a$item$delta[7], "mirt"=stats::plogis( cmod$ldelta[7] ) ), 4 )
##D   ##     sirt   mirt
##D   ##   0.6298 0.6297
##D # compare thresholds a*b
##D dfr <- cbind( "sirt"=mod1a$item$thresh,
##D                "mirt"=c(- cmod$d[-7],cmod$b1[7]*cmod$a1[1], cmod$b2[7]*cmod$a1[1]))
##D round(dfr,4)
##D   ##           sirt    mirt
##D   ##   [1,] -1.9236 -1.9231
##D   ##   [2,] -0.0565 -0.0562
##D   ##   [3,]  0.3993  0.3996
##D   ##   [4,]  0.8058  0.8061
##D   ##   [5,]  1.5293  1.5295
##D   ##   [6,]  1.9569  1.9572
##D   ##   [7,] -1.1414 -1.1404
##D   ##   [8,] -0.4005 -0.3996
## End(Not run)



