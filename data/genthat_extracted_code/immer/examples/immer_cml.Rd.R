library(immer)


### Name: immer_cml
### Title: Conditional Maximum Likelihood Estimation for the Linear
###   Logistic Partial Credit Model
### Aliases: immer_cml summary.immer_cml logLik.immer_cml anova.immer_cml
###   coef.immer_cml vcov.immer_cml
### Keywords: Conditional maximum likelihood estimation summary

### ** Examples

library(sirt)
library(psychotools)
library(TAM)
library(CDM)
library(eRm)

#############################################################################
# EXAMPLE 1: Dichotomous data data.read
#############################################################################

data(data.read, package="sirt")
dat <- data.read
I <- ncol(dat)

#----------------------------------------------------------------
#--- Model 1: Rasch model, setting first item difficulty to zero
mod1a <- immer::immer_cml( dat=dat)
summary(mod1a)
logLik(mod1a) # extract log likelihood
coef(mod1a)   # extract coefficients

## Not run: 
##D # estimate model in psychotools package
##D mod1b <- psychotools::raschmodel(dat)
##D summary(mod1b)
##D logLik(mod1b)
##D 
##D # estimate model in eRm package
##D mod1c <- eRm::RM(dat, sum0=FALSE)
##D summary(mod1c)
##D mod1c$etapar
##D 
##D # compare estimates of three packages
##D cbind( coef(mod1a), coef(mod1b), mod1c$etapar )
##D 
##D #----------------------------------------------------------------
##D #-- Model 2: Rasch model sum normalization
##D mod2a <- immer::immer_cml( dat=dat, normalization="sum")
##D summary(mod2a)
##D 
##D # compare estimation in TAM
##D mod2b <- tam.mml( dat, constraint="items"  )
##D summary(mod2b)
##D mod2b$A[,2,]
##D 
##D #----------------------------------------------------------------
##D #--- Model 3: some fixed item parameters
##D # fix item difficulties of items 1,4,8
##D # define fixed parameters in constant parameter vector
##D b_const <- rep(0,I)
##D fix_items <- c(1,4,8)
##D b_const[ fix_items ] <- c( -2.1, .195, -.95 )
##D # design matrix
##D W <- matrix( 0, nrow=12, ncol=9)
##D W[ cbind( setdiff( 1:12, fix_items ), 1:9 ) ] <- 1
##D colnames(W) <- colnames(dat)[ - fix_items ]
##D # estimate model
##D mod3 <- immer::immer_cml( dat=dat, W=W, b_const=b_const)
##D summary(mod3)
##D 
##D #----------------------------------------------------------------
##D #--- Model 4: One parameter logistic model
##D # estimate non-integer item discriminations with 2PL model
##D I <- ncol(dat)
##D mod4a <- sirt::rasch.mml2( dat, est.a=1:I )
##D summary(mod4a)
##D a <- mod4a$item$a     # extract (non-integer) item discriminations
##D # estimate integer item discriminations ranging from 1 to 3
##D a_integer <- immer::immer_opcat( a, hmean=2, min=1, max=3 )
##D # estimate one-parameter model with fixed integer item discriminations
##D mod4 <- immer::immer_cml( dat=dat, a=a_integer )
##D summary(mod4)
##D 
##D #----------------------------------------------------------------
##D #--- Model 5: Linear logistic test model
##D 
##D # define design matrix
##D W <- matrix( 0, nrow=12, ncol=5 )
##D colnames(W) <- c("B","C", paste0("Pos", 2:4))
##D rownames(W) <- colnames(dat)
##D W[ 5:8, "B" ] <- 1
##D W[ 9:12, "C" ] <- 1
##D W[ c(2,6,10), "Pos2" ] <- 1
##D W[ c(3,7,11), "Pos3" ] <- 1
##D W[ c(4,8,12), "Pos4" ] <- 1
##D 
##D # estimation with immer_cml
##D mod5a <- immer::immer_cml( dat, W=W )
##D summary(mod5a)
##D 
##D # estimation in eRm package
##D mod5b <- eRm::LLTM( dat, W=W )
##D summary(mod5b)
##D 
##D # compare models 1 and 5 by a likelihood ratio test
##D anova( mod1a, mod5a )
##D 
##D #############################################################################
##D # EXAMPLE 2: Polytomous data | data.Students
##D #############################################################################
##D 
##D data(data.Students,package="CDM")
##D dat <- data.Students
##D dat <- dat[, grep("act", colnames(dat) ) ]
##D dat <- dat[1:400,]  # select a subdataset
##D dat <- dat[ rowSums( 1 - is.na(dat) ) > 1, ]
##D     # remove persons with less than two valid responses
##D 
##D #----------------------------------------------------------------
##D #--- Model 1: Partial credit model with constraint on first parameter
##D mod1a <- immer::immer_cml( dat=dat )
##D summary(mod1a)
##D # compare pcmodel function from psychotools package
##D mod1b <- psychotools::pcmodel( dat )
##D summary(mod1b)
##D # estimation in eRm package
##D mod1c <- eRm::PCM( dat, sum0=FALSE )
##D   # -> subjects with only one valid response must be removed
##D summary(mod1c)
##D 
##D #----------------------------------------------------------------
##D #-- Model 2: Partial credit model with sum constraint on item difficulties
##D mod2a <- immer::immer_cml( dat=dat, irtmodel="PCM2", normalization="sum")
##D summary(mod2a)
##D # compare with estimation in TAM
##D mod2b <- TAM::tam.mml( dat, irtmodel="PCM2", constraint="items")
##D summary(mod2b)
##D 
##D #----------------------------------------------------------------
##D #-- Model 3: Partial credit model with fixed integer item discriminations
##D mod3 <- immer::immer_cml( dat=dat, normalization="first", a=c(2,2,1,3,1) )
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 3: Polytomous data | Extracting the structure of W matrix
##D #############################################################################
##D 
##D data(data.mixed1, package="sirt")
##D dat <- data.mixed1
##D 
##D # use non-exported function "lpcm_data_prep" to extract the meaning
##D # of the rows in W which are contained in value "pars_info"
##D res <- immer:::lpcm_data_prep( dat, weights=NULL, a=NULL )
##D pi2 <- res$pars_info
##D 
##D # create design matrix with some restrictions on item parameters
##D W <- matrix( 0, nrow=nrow(pi2), ncol=2 )
##D colnames(W) <- c( "P2", "P3" )
##D rownames(W) <- res$parnames
##D 
##D # joint item parameter for items I19 and I20 fixed at zero
##D # item parameter items I21 and I22
##D W[ 3:10, 1 ] <- pi2$cat[ 3:10 ]
##D # item parameters I23, I24 and I25
##D W[ 11:13, 2] <- 1
##D 
##D # estimate model with design matrix W
##D mod <- immer::immer_cml( dat, W=W)
##D summary(mod)
##D 
##D #############################################################################
##D # EXAMPLE 4: Partial credit model with raters
##D #############################################################################
##D 
##D data(data.immer07)
##D dat <- data.immer07
##D 
##D #*** reshape dataset for one variable
##D dfr1 <- immer::immer_reshape_wideformat( dat$I1, rater=dat$rater, pid=dat$pid )
##D 
##D #-- extract structure of design matrix
##D res <- immer:::lpcm_data_prep( dat=dfr1[,-1], weights=NULL, a=NULL)
##D pars_info <- res$pars_info
##D 
##D # specify design matrix for partial credit model and main rater effects
##D # -> set sum of all rater effects to zero
##D W <- matrix( 0, nrow=nrow(pars_info), ncol=3+2 )
##D rownames(W) <- rownames(pars_info)
##D colnames(W) <- c( "Cat1", "Cat2", "Cat3", "R1", "R2" )
##D # define item parameters
##D W[ cbind( pars_info$index, pars_info$cat ) ] <- 1
##D # define rater parameters
##D W[ paste(pars_info$item)=="R1", "R1" ] <- 1
##D W[ paste(pars_info$item)=="R2", "R2" ] <- 1
##D W[ paste(pars_info$item)=="R3", c("R1","R2") ] <- -1
##D # set parameter of first category to zero for identification constraints
##D W <- W[,-1]
##D 
##D # estimate model
##D mod <- immer::immer_cml( dfr1[,-1], W=W)
##D summary(mod)
##D 
##D #############################################################################
##D # EXAMPLE 5: Multi-faceted Rasch model | Estimation with a design matrix
##D #############################################################################
##D 
##D data(data.immer07)
##D dat <- data.immer07
##D 
##D #*** reshape dataset
##D dfr1 <- immer::immer_reshape_wideformat( dat[, paste0("I",1:4) ], rater=dat$rater,
##D                 pid=dat$pid )
##D 
##D #-- structure of design matrix
##D res <- immer:::lpcm_data_prep( dat=dfr1[,-1], weights=NULL, a=NULL)
##D pars_info <- res$pars_info
##D 
##D #--- define design matrix for multi-faceted Rasch model with only main effects
##D W <- matrix( 0, nrow=nrow(pars_info), ncol=3+2+2 )
##D parnames <- rownames(W) <- rownames(pars_info)
##D colnames(W) <- c( paste0("I",1:3), paste0("Cat",1:2), paste0("R",1:2) )
##D #+ define item effects
##D for (ii in c("I1","I2","I3") ){
##D     ind <- grep( ii, parnames )
##D     W[ ind, ii ] <- pars_info$cat[ind ]
##D                 }
##D ind <- grep( "I4", parnames )
##D W[ ind, c("I1","I2","I3") ] <- -pars_info$cat[ind ]
##D #+ define step parameters
##D for (cc in 1:2 ){
##D     ind <- which( pars_info$cat==cc )
##D     W[ ind, paste0("Cat",1:cc) ] <- 1
##D                 }
##D #+ define rater effects
##D for (ii in c("R1","R2") ){
##D     ind <- grep( ii, parnames )
##D     W[ ind, ii ] <- pars_info$cat[ind ]
##D                 }
##D ind <- grep( "R3", parnames )
##D W[ ind, c("R1","R2") ] <- -pars_info$cat[ind ]
##D 
##D #--- estimate model with immer_cml
##D mod1 <- immer::immer_cml( dfr1[,-1], W=W, par_init=rep(0,ncol(W) ) )
##D summary(mod1)
##D 
##D #--- comparison with estimation in TAM
##D resp <- dfr1[,-1]
##D mod2 <- TAM::tam.mml.mfr( resp=dat[,-c(1:2)], facets=dat[, "rater", drop=FALSE ],
##D             pid=dat$pid, formulaA=~ item + step + rater )
##D summary(mod2)
## End(Not run)



