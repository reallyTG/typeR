library(sirt)


### Name: data.g308
### Title: C-Test Datasets
### Aliases: data.g308
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Dataset G308 from Schroeders et al. (2014)
##D #############################################################################
##D 
##D data(data.g308)
##D dat <- data.g308
##D 
##D library(TAM)
##D library(sirt)
##D library(combinat)
##D 
##D # define testlets
##D testlet <- c(1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 4, 4, 4, 4, 4, 5, 5, 6, 6, 6)
##D 
##D #****************************************
##D #*** Model 1: Rasch model
##D mod1 <- TAM::tam.mml(resp=dat[,-1], pid=dat[,1],
##D        control=list(maxiter=300, snodes=1500))
##D summary(mod1)
##D 
##D #****************************************
##D #*** Model 2: Rasch testlet model
##D 
##D # testlets are dimensions, assign items to Q-matrix
##D TT <- length(unique(testlet))
##D Q <- matrix(0, nrow=ncol(dat)-1, ncol=TT + 1)
##D Q[,1] <- 1 # First dimension constitutes g-factor
##D for (tt in 1:TT){Q[testlet==tt, tt+1] <- 1}
##D 
##D # In a testlet model, all dimensions are uncorrelated among
##D # each other, that is, all pairwise correlations are set to 0,
##D # which can be accomplished with the "variance.fixed" command
##D variance.fixed <- cbind(t( combinat::combn(TT+1,2)), 0)
##D mod2 <- TAM::tam.mml(resp=dat[,-1], pid=dat[,1], Q=Q,
##D             variance.fixed=variance.fixed,
##D             control=list(snodes=1500, maxiter=300))
##D summary(mod2)
##D 
##D #****************************************
##D #*** Model 3: Partial credit model
##D 
##D scores <- list()
##D testlet.names <- NULL
##D dat.pcm <- NULL
##D for (tt in 1:max(testlet) ){
##D    scores[[tt]] <- rowSums (dat[,-1][, testlet==tt, drop=FALSE])
##D    dat.pcm <- c(dat.pcm, list(c(scores[[tt]])))
##D    testlet.names <- append(testlet.names, paste0("testlet",tt) )
##D    }
##D dat.pcm <- as.data.frame(dat.pcm)
##D colnames(dat.pcm) <- testlet.names
##D mod3 <- TAM::tam.mml(resp=dat.pcm, control=list(snodes=1500, maxiter=300) )
##D summary(mod3)
##D 
##D #****************************************
##D #*** Model 4: Copula model
##D 
##D mod4 <- sirt::rasch.copula2 (dat=dat[,-1], itemcluster=testlet)
##D summary(mod4)
## End(Not run)



