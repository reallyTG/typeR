library(sirt)


### Name: prob.guttman
### Title: Probabilistic Guttman Model
### Aliases: prob.guttman summary.prob.guttman logLik.prob.guttman
###   anova.prob.guttman IRT.likelihood.prob.guttman
###   IRT.posterior.prob.guttman IRT.irfprob.prob.guttman
### Keywords: Probabilistic Guttman model summary

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset Reading
#############################################################################
data(data.read)
dat <- data.read

#***
# Model 1: estimate probabilistic Guttman model
mod1 <- sirt::prob.guttman( dat )
summary(mod1)

#***
# Model 2: probabilistic Guttman model with equal guessing and slipping parameters
mod2 <- sirt::prob.guttman( dat, guess.equal=TRUE, slip.equal=TRUE)
summary(mod2)

#***
# Model 3: Guttman model with three a priori specified item levels
itemlevel <- rep(1,12)
itemlevel[ c(2,5,8,10,12) ] <- 2
itemlevel[ c(3,4,6) ] <- 3
mod3 <- sirt::prob.guttman( dat, itemlevel=itemlevel )
summary(mod3)

## Not run: 
##D #***
##D # Model3m: estimate Model 3 in mirt
##D 
##D library(mirt)
##D # define four ordered latent classes
##D Theta <- scan(nlines=1)
##D    0 0 0    1 0 0   1 1 0   1 1 1
##D Theta <- matrix( Theta, nrow=4, ncol=3,byrow=TRUE)
##D 
##D # define mirt model
##D I <- ncol(dat)  # I=12
##D mirtmodel <- mirt::mirt.model("
##D         # specify factors for each item level
##D         C1=1,7,9,11
##D         C2=2,5,8,10,12
##D         C3=3,4,6
##D         ")
##D # get initial parameter values
##D mod.pars <- mirt::mirt(dat, model=mirtmodel,  pars="values")
##D # redefine initial parameter values
##D mod.pars[ mod.pars$name=="d","value" ]  <- -1
##D mod.pars[ mod.pars$name %in% paste0("a",1:3) & mod.pars$est ,"value" ]  <- 2
##D mod.pars
##D # define prior for latent class analysis
##D lca_prior <- function(Theta,Etable){
##D   # number of latent Theta classes
##D   TP <- nrow(Theta)
##D   # prior in initial iteration
##D   if ( is.null(Etable) ){ prior <- rep( 1/TP, TP ) }
##D   # process Etable (this is correct for datasets without missing data)
##D   if ( ! is.null(Etable) ){
##D     # sum over correct and incorrect expected responses
##D     prior <- ( rowSums(Etable[, seq(1,2*I,2)]) + rowSums(Etable[,seq(2,2*I,2)]) )/I
##D                  }
##D   prior <- prior / sum(prior)
##D   return(prior)
##D }
##D # estimate model in mirt
##D mod3m <- mirt::mirt(dat, mirtmodel, pars=mod.pars, verbose=TRUE,
##D             technical=list( customTheta=Theta, customPriorFun=lca_prior) )
##D # correct number of estimated parameters
##D mod3m@nest <- as.integer(sum(mod.pars$est) + nrow(Theta)-1 )
##D # extract log-likelihood and compute AIC and BIC
##D mod3m@logLik
##D ( AIC <- -2*mod3m@logLik+2*mod3m@nest )
##D ( BIC <- -2*mod3m@logLik+log(mod3m@Data$N)*mod3m@nest )
##D # compare with information criteria from prob.guttman
##D mod3$ic
##D # model fit in mirt
##D mirt::M2(mod3m)
##D # extract coefficients
##D ( cmod3m <- sirt::mirt.wrapper.coef(mod3m) )
##D # compare estimated distributions
##D round( cbind( "sirt"=mod3$trait$prob, "mirt"=mod3m@Prior[[1]] ), 5 )
##D   ##           sirt    mirt
##D   ##   [1,] 0.13709 0.13765
##D   ##   [2,] 0.30266 0.30303
##D   ##   [3,] 0.15239 0.15085
##D   ##   [4,] 0.40786 0.40846
##D # compare estimated item parameters
##D ipars <- data.frame( "guess.sirt"=mod3$item$guess,
##D                      "guess.mirt"=plogis( cmod3m$coef$d ) )
##D ipars$slip.sirt <- mod3$item$slip
##D ipars$slip.mirt <- 1-plogis( rowSums(cmod3m$coef[, c("a1","a2","a3","d") ] ) )
##D round( ipars, 4 )
##D   ##      guess.sirt guess.mirt slip.sirt slip.mirt
##D   ##   1      0.7810     0.7804    0.1383    0.1382
##D   ##   2      0.4513     0.4517    0.0373    0.0368
##D   ##   3      0.3203     0.3200    0.0747    0.0751
##D   ##   4      0.3009     0.3007    0.3082    0.3087
##D   ##   5      0.5776     0.5779    0.1800    0.1798
##D   ##   6      0.3758     0.3759    0.3047    0.3051
##D   ##   7      0.7262     0.7259    0.0625    0.0623
##D   ##   [...]
##D 
##D #***
##D # Model 4: Monotone item response function estimated in mirt
##D 
##D # define four ordered latent classes
##D Theta <- scan(nlines=1)
##D    0 0 0    1 0 0   1 1 0   1 1 1
##D Theta <- matrix( Theta, nrow=4, ncol=3,byrow=TRUE)
##D 
##D # define mirt model
##D I <- ncol(dat)  # I=12
##D mirtmodel <- mirt::mirt.model("
##D         # specify factors for each item level
##D         C1=1-12
##D         C2=1-12
##D         C3=1-12
##D         ")
##D # get initial parameter values
##D mod.pars <- mirt::mirt(dat, model=mirtmodel,  pars="values")
##D # redefine initial parameter values
##D mod.pars[ mod.pars$name=="d","value" ]  <- -1
##D mod.pars[ mod.pars$name %in% paste0("a",1:3) & mod.pars$est ,"value" ]  <- .6
##D # set lower bound to zero ton ensure monotonicity
##D mod.pars[ mod.pars$name %in% paste0("a",1:3)  ,"lbound" ]  <- 0
##D mod.pars
##D # estimate model in mirt
##D mod4 <- mirt::mirt(dat, mirtmodel, pars=mod.pars, verbose=TRUE,
##D             technical=list( customTheta=Theta, customPriorFun=lca_prior) )
##D # correct number of estimated parameters
##D mod4@nest <- as.integer(sum(mod.pars$est) + nrow(Theta)-1 )
##D # extract coefficients
##D cmod4 <- sirt::mirt.wrapper.coef(mod4)
##D cmod4
##D # compute item response functions
##D cmod4c <- cmod4$coef[, c("d", "a1", "a2", "a3" ) ]
##D probs4 <- t( apply( cmod4c, 1, FUN=function(ll){
##D                  plogis(cumsum(as.numeric(ll))) } ) )
##D matplot( 1:4,  t(probs4), type="b", pch=1:I)
## End(Not run)



