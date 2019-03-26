library(sirt)


### Name: noharm.sirt
### Title: NOHARM Model in R
### Aliases: noharm.sirt summary.noharm.sirt
### Keywords: NOHARM summary

### ** Examples

#############################################################################
# EXAMPLE 1: Two-dimensional IRT model with 10 items
#############################################################################

#**** data simulation
set.seed(9776)
N <- 3400 # sample size
# define difficulties
f0 <- c( .5, .25, -.25, -.5, 0, -.5, -.25, .25, .5, 0 )
I <- length(f0)
# define loadings
f1 <- matrix( 0, I, 2 )
f1[ 1:5,1] <- c(.8,.7,.6,.5, .5)
f1[ 6:10,2] <- c(.8,.7,.6,.5, .5 )
# covariance matrix
Pval <- matrix( c(1,.5,.5,1), 2, 2 )
# simulate theta
library(mvtnorm)
theta <- mvtnorm::rmvnorm(N, mean=c(0,0), sigma=Pval )
# simulate item responses
dat <- matrix( NA, N, I )
for (ii in 1:I){ # ii <- 1
    dat[,ii] <- 1*( stats::pnorm(f0[ii]+theta[,1]*f1[ii,1]+theta[,2]*f1[ii,2])>
                     stats::runif(N) )
        }
colnames(dat) <- paste0("I", 1:I)

#**** Model 1: Two-dimensional CFA with estimated item loadings
# define pattern matrices
Pval <- .3+0*Pval
Ppatt <- 1*(Pval>0)
diag(Ppatt) <- 0
diag(Pval) <- 1
Fval <- .7 * ( f1>0)
Fpatt <- 1 * ( Fval > 0 )
# estimate model
mod1 <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval )
summary(mod1)
# EAP ability estimates
pmod1 <- sirt::R2noharm.EAP(mod1, theta.k=seq(-4,4,len=10) )
# model fit
summary( sirt::modelfit.sirt( mod1 ))

# estimate model based on tetrachoric correlations
mod1b <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval,
            modesttype=2)
summary(mod1b)

## Not run: 
##D #**** Model 2: Two-dimensional CFA with correlated residuals
##D # define pattern matrix for residual correlation
##D Psipatt <- 0*diag(I)
##D Psipatt[1,2] <- 1
##D Psival <- 0*Psipatt
##D # estimate model
##D mod2 <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval,
##D             Psival=Psival, Psipatt=Psipatt )
##D summary(mod2)
##D 
##D #**** Model 3: Two-dimensional Rasch model
##D # pattern matrices
##D Fval <- matrix(0,10,2)
##D Fval[1:5,1] <- Fval[6:10,2] <- 1
##D Fpatt <- 0*Fval
##D Ppatt <- Pval <- matrix(1,2,2)
##D Pval[1,2] <- Pval[2,1] <- 0
##D # estimate model
##D mod3 <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval )
##D summary(mod3)
##D # model fit
##D summary( sirt::modelfit.sirt( mod3 ))
##D 
##D #** compare fit with NOHARM
##D noharm.path <- "c:/NOHARM"
##D P.pattern <- Ppatt ; P.init <- Pval
##D F.pattern <- Fpatt ; F.init <- Fval
##D mod3b <- sirt::R2noharm( dat=dat, model.type="CFA",
##D              F.pattern=F.pattern, F.init=F.init, P.pattern=P.pattern,
##D              P.init=P.init, writename="example_sim_2dim_rasch",
##D              noharm.path=noharm.path, dec="," )
##D summary(mod3b)
##D 
##D #############################################################################
##D # EXAMPLE 2: data.read
##D #############################################################################
##D 
##D data(data.read)
##D dat <- data.read
##D I <- ncol(dat)
##D 
##D #**** Model 1: Unidimensional Rasch model
##D Fpatt <- matrix( 0, I, 1 )
##D Fval <- 1 + 0*Fpatt
##D Ppatt <- Pval <- matrix(1,1,1)
##D # estimate model
##D mod1 <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval )
##D summary(mod1)
##D plot(mod1)    # semPaths plot
##D 
##D #**** Model 2: Rasch model in which item pairs within a testlet are excluded
##D wgtm <- matrix( 1, I, I )
##D wgtm[1:4,1:4] <- wgtm[5:8,5:8] <- wgtm[ 9:12, 9:12] <- 0
##D # estimation
##D mod2 <- sirt::noharm.sirt(dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval, wgtm=wgtm)
##D summary(mod2)
##D 
##D #**** Model 3: Rasch model with correlated residuals
##D Psipatt <- Psival <- 0*diag(I)
##D Psipatt[1:4,1:4] <- Psipatt[5:8,5:8] <- Psipatt[ 9:12, 9:12] <- 1
##D diag(Psipatt) <- 0
##D Psival <- .6*(Psipatt>0)
##D # estimation
##D mod3 <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval,
##D             Psival=Psival, Psipatt=Psipatt )
##D summary(mod3)
##D # allow only positive residual correlations
##D mod3b <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt, Fpatt=Fpatt, Fval=Fval, Pval=Pval,
##D             Psival=Psival, Psipatt=Psipatt, pos.residcorr=TRUE)
##D summary(mod3b)
##D 
##D #**** Model 4: Rasch testlet model
##D Fval <- Fpatt <- matrix( 0, I, 4 )
##D Fval[,1] <- Fval[1:4,2] <- Fval[5:8,3] <- Fval[9:12,4 ] <- 1
##D Ppatt <- Pval <- diag(4)
##D colnames(Ppatt) <- c("g", "A", "B","C")
##D Pval <- .5*Pval
##D # estimation
##D mod4 <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval  )
##D summary(mod4)
##D # allow only positive variance entries
##D mod4b <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval,
##D                pos.variance=TRUE )
##D summary(mod4b)
##D 
##D #**** Model 5: Bifactor model
##D Fval <- matrix( 0, I, 4 )
##D Fval[,1] <- Fval[1:4,2] <- Fval[5:8,3] <- Fval[9:12,4 ] <- .6
##D Fpatt <- 1 * ( Fval > 0 )
##D Pval <- diag(4)
##D Ppatt <- 0*Pval
##D colnames(Ppatt) <- c("g", "A", "B","C")
##D # estimation
##D mod5 <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval  )
##D summary(mod5)
##D # allow only positive loadings
##D mod5b <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval,
##D               pos.loading=TRUE )
##D summary(mod5b)
##D summary( sirt::modelfit.sirt(mod5b))
##D 
##D #**** Model 6: 3-dimensional Rasch model
##D Fval <- matrix( 0, I, 3 )
##D Fval[1:4,1] <- Fval[5:8,2] <- Fval[9:12,3 ] <- 1
##D Fpatt <- 0*Fval
##D Pval <- .6*diag(3)
##D diag(Pval) <- 1
##D Ppatt <- 1+0*Pval
##D colnames(Ppatt) <- c("A", "B","C")
##D # estimation
##D mod6 <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval  )
##D summary(mod6)
##D summary( sirt::modelfit.sirt(mod6) )  # model fit
##D 
##D #**** Model 7: 3-dimensional 2PL model
##D Fval <- matrix( 0, I, 3 )
##D Fval[1:4,1] <- Fval[5:8,2] <- Fval[9:12,3 ] <- 1
##D Fpatt <- Fval
##D Pval <- .6*diag(3)
##D diag(Pval) <- 1
##D Ppatt <- 1+0*Pval
##D diag(Ppatt) <- 0
##D colnames(Ppatt) <- c("A", "B","C")
##D # estimation
##D mod7 <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt,Fpatt=Fpatt, Fval=Fval, Pval=Pval  )
##D summary(mod7)
##D summary( sirt::modelfit.sirt(mod7) )
##D 
##D #**** Model 8: Exploratory factor analysis with 3 dimensions
##D # estimation
##D mod8 <- sirt::noharm.sirt( dat=dat, dimensions=3  )
##D summary(mod8)
## End(Not run)



