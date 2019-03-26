library(sirt)


### Name: rasch.pml3
### Title: Pairwise Marginal Likelihood Estimation for the Probit Rasch
###   Model
### Aliases: rasch.pml3 summary.rasch.pml
### Keywords: Pairwise marginal maximum likelihood (PMML) Local dependence
###   summary

### ** Examples

#############################################################################
# EXAMPLE 1: Reading data set
#############################################################################

data(data.read)
dat <- data.read

#******
# Model 1: Rasch model with PML estimation
mod1 <- sirt::rasch.pml3( dat )
summary(mod1)

#******
# Model 2: Excluding item pairs with local dependence
#          from bivariate composite likelihood
itemcluster <- rep( 1:3, each=4)
mod2 <- sirt::rasch.pml3( dat, itemcluster=itemcluster )
summary(mod2)

## Not run: 
##D #*****
##D # Model 3: Modelling error correlations:
##D #          joint residual correlations for each itemcluster
##D error.corr <- diag(1,ncol(dat))
##D for ( ii in 1:3){
##D     ind.ii <- which( itemcluster==ii )
##D     error.corr[ ind.ii, ind.ii ] <- ii
##D         }
##D # estimate the model with error correlations
##D mod3 <- sirt::rasch.pml3( dat, error.corr=error.corr )
##D summary(mod3)
##D 
##D #****
##D # Model 4: model separate residual correlations
##D I <- ncol(error.corr)
##D error.corr1 <- matrix( 1:(I*I), ncol=I )
##D error.corr <- error.corr1 * ( error.corr > 0 )
##D # estimate the model with error correlations
##D mod4 <- sirt::rasch.pml3( dat, error.corr=error.corr )
##D summary(mod4)
##D 
##D #****
##D # Model 5:  assume equal item difficulties:
##D # b_1=b_7 and b_2=b_12
##D # fix item difficulty of the 6th item to .1
##D est.b <- 1:I
##D est.b[7] <- 1; est.b[12] <- 2 ; est.b[6] <- 0
##D b.init <- rep( 0, I ) ; b.init[6] <- .1
##D mod5 <- sirt::rasch.pml3( dat, est.b=est.b, b.init=b.init)
##D summary(mod5)
##D 
##D #****
##D # Model 6: estimate three item slope groups
##D est.a <- rep(1:3, each=4 )
##D mod6 <- sirt::rasch.pml3( dat, est.a=est.a, est.sigma=0)
##D summary(mod6)
##D 
##D #############################################################################
##D # EXAMPLE 2: PISA reading
##D #############################################################################
##D 
##D data(data.pisaRead)
##D dat <- data.pisaRead$data
##D 
##D # select items
##D dat <- dat[, substring(colnames(dat),1,1)=="R" ]
##D 
##D #******
##D # Model 1: Rasch model with PML estimation
##D mod1 <- sirt::rasch.pml3( as.matrix(dat) )
##D   ## Trait SD (Logit Link) : 1.419
##D 
##D #******
##D # Model 2: Model correlations within testlets
##D error.corr <- diag(1,ncol(dat))
##D testlets <- paste( data.pisaRead$item$testlet )
##D itemcluster <- match( testlets, unique(testlets ) )
##D for ( ii in 1:(length(unique(testlets))) ){
##D     ind.ii <- which( itemcluster==ii )
##D     error.corr[ ind.ii, ind.ii ] <- ii
##D         }
##D # estimate the model with error correlations
##D mod2 <- sirt::rasch.pml3( dat, error.corr=error.corr )
##D   ## Trait SD (Logit Link) : 1.384
##D 
##D #****
##D # Model 3: model separate residual correlations
##D I <- ncol(error.corr)
##D error.corr1 <- matrix( 1:(I*I), ncol=I )
##D error.corr <- error.corr1 * ( error.corr > 0 )
##D # estimate the model with error correlations
##D mod3 <- sirt::rasch.pml3( dat, error.corr=error.corr )
##D   ## Trait SD (Logit Link) : 1.384
##D 
##D #############################################################################
##D # EXAMPLE 3: 10 locally independent items
##D #############################################################################
##D 
##D #**********
##D # simulate some data
##D set.seed(554)
##D N <- 500    # persons
##D I <- 10        # items
##D theta <- stats::rnorm(N,sd=1.3 )    # trait SD of 1.3
##D b <- seq(-2, 2, length=I) # item difficulties
##D 
##D # simulate data from the Rasch model
##D dat <- sirt::sim.raschtype( theta=theta, b=b )
##D 
##D # estimation with rasch.pml and probit link
##D mod1 <- sirt::rasch.pml3( dat )
##D summary(mod1)
##D 
##D # estimation with rasch.mml2 function
##D mod2 <- sirt::rasch.mml2( dat )
##D 
##D # estimate item parameters for groups with five item parameters each
##D est.b <- rep( 1:(I/2), each=2 )
##D mod3 <- sirt::rasch.pml3( dat, est.b=est.b )
##D summary(mod3)
##D 
##D # compare parameter estimates
##D summary(mod1)
##D summary(mod2)
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 4: 11 items and 2 item clusters with 2 and 3 items
##D #############################################################################
##D 
##D set.seed(5698)
##D I <- 11                             # number of items
##D n <- 5000                           # number of persons
##D b <- seq(-2,2, len=I)               # item difficulties
##D theta <- stats::rnorm( n, sd=1 ) # person abilities
##D # itemcluster
##D itemcluster <- rep(0,I)
##D itemcluster[c(3,5)] <- 1
##D itemcluster[c(2,4,9)] <- 2
##D # residual correlations
##D rho <- c( .7, .5 )
##D 
##D # simulate data (under the logit link)
##D dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
##D colnames(dat) <- paste("I", seq(1,ncol(dat)), sep="")
##D 
##D #***
##D # Model 1: estimation using the Rasch model (with probit link)
##D mod1 <- sirt::rasch.pml3( dat )
##D #***
##D # Model 2: estimation when pairs of locally dependent items are eliminated
##D mod2 <- sirt::rasch.pml3( dat, itemcluster=itemcluster)
##D 
##D #***
##D # Model 3: Positive correlations within testlets
##D est.corrs <- diag( 1, I )
##D est.corrs[ c(3,5), c(3,5) ] <- 2
##D est.corrs[ c(2,4,9), c(2,4,9) ] <- 3
##D mod3 <- sirt::rasch.pml3( dat, error.corr=est.corrs )
##D 
##D #***
##D # Model 4: Negative correlations between testlets
##D est.corrs <- diag( 1, I )
##D est.corrs[ c(3,5), c(2,4,9) ] <- 2
##D est.corrs[ c(2,4,9), c(3,5) ] <- 2
##D mod4 <- sirt::rasch.pml3( dat, error.corr=est.corrs )
##D 
##D #***
##D # Model 5: sum constraint of zero within and between testlets
##D est.corrs <- matrix( 1:(I*I),  I, I )
##D cluster2 <- c(2,4,9)
##D est.corrs[ setdiff( 1:I, c(cluster2)),  ] <- 0
##D est.corrs[, setdiff( 1:I, c(cluster2))  ] <- 0
##D # define an error constraint matrix
##D itempairs0 <- mod4$itempairs
##D IP <- nrow(itempairs0)
##D err.constraint <- matrix( 0, IP, 1 )
##D err.constraint[ ( itempairs0$item1 %in% cluster2 )
##D        & ( itempairs0$item2 %in% cluster2 ), 1 ] <- 1
##D # set sum of error covariances to 1.2
##D err.constraintV <- matrix(3*.4,1,1)
##D 
##D mod5 <- sirt::rasch.pml3( dat, error.corr=est.corrs,
##D          err.constraintM=err.constraint, err.constraintV=err.constraintV)
##D 
##D #****
##D # Model 6: Constraint on sum of all correlations
##D est.corrs <- matrix( 1:(I*I),  I, I )
##D # define an error constraint matrix
##D itempairs0 <- mod4$itempairs
##D IP <- nrow(itempairs0)
##D # define two side conditions
##D err.constraint <- matrix( 0, IP, 2 )
##D err.constraintV <- matrix( 0, 2, 1)
##D # sum of all correlations is zero
##D err.constraint[, 1 ] <- 1
##D err.constraintV[1,1] <- 0
##D # sum of items cluster c(1,2,3) is 0
##D cluster2 <- c(1,2,3)
##D err.constraint[ ( itempairs0$item1 %in%  cluster2 )
##D        & ( itempairs0$item2 %in% cluster2 ), 2 ] <- 1
##D err.constraintV[2,1] <- 0
##D 
##D mod6 <- sirt::rasch.pml3( dat, error.corr=est.corrs,
##D     err.constraintM=err.constraint,  err.constraintV=err.constraintV)
##D summary(mod6)
##D 
##D #############################################################################
##D # EXAMPLE 5: 10 Items: Cluster 1 -> Items 1,2
##D #         Cluster 2 -> Items 3,4,5;   Cluster 3 -> Items 7,8,9
##D #############################################################################
##D 
##D set.seed(7650)
##D I <- 10                             # number of items
##D n <- 5000                           # number of persons
##D b <- seq(-2,2, len=I)               # item difficulties
##D bsamp <- b <- sample(b)             # sample item difficulties
##D theta <- stats::rnorm( n, sd=1 ) # person abilities
##D # define itemcluster
##D itemcluster <- rep(0,I)
##D itemcluster[ 1:2 ] <- 1
##D itemcluster[ 3:5 ] <- 2
##D itemcluster[ 7:9 ] <- 3
##D # define residual correlations
##D rho <- c( .55, .35, .45)
##D 
##D # simulate data
##D dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
##D colnames(dat) <- paste("I", seq(1,ncol(dat)), sep="")
##D 
##D #***
##D # Model 1: residual correlation (equal within item clusters)
##D # define a matrix of integers for estimating error correlations
##D error.corr <- diag(1,ncol(dat))
##D for ( ii in 1:3){
##D     ind.ii <- which( itemcluster==ii )
##D     error.corr[ ind.ii, ind.ii ] <- ii
##D         }
##D # estimate the model
##D mod1 <- sirt::rasch.pml3( dat, error.corr=error.corr )
##D 
##D #***
##D # Model 2: residual correlation (different within item clusters)
##D # define again a matrix of integers for estimating error correlations
##D error.corr <- diag(1,ncol(dat))
##D for ( ii in 1:3){
##D     ind.ii <- which( itemcluster==ii )
##D     error.corr[ ind.ii, ind.ii ] <- ii
##D         }
##D I <- ncol(error.corr)
##D error.corr1 <- matrix( 1:(I*I), ncol=I )
##D error.corr <- error.corr1 * ( error.corr > 0 )
##D # estimate the model
##D mod2 <- sirt::rasch.pml3( dat, error.corr=error.corr )
##D 
##D #***
##D # Model 3: eliminate item pairs within itemclusters for PML estimation
##D mod3 <- sirt::rasch.pml3( dat, itemcluster=itemcluster )
##D 
##D #***
##D # Model 4: Rasch model ignoring dependency
##D mod4 <- sirt::rasch.pml3( dat )
##D 
##D # compare different models
##D summary(mod1)
##D summary(mod2)
##D summary(mod3)
##D summary(mod4)
## End(Not run)



