library(sirt)


### Name: data.sirt
### Title: Some Example Datasets for the 'sirt' Package
### Aliases: data.sirt data.si01 data.si02 data.si03 data.si04 data.si05
###   data.si06
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Nested logit model multiple choice dataset data.si06
##D #############################################################################
##D 
##D data(data.si06)
##D dat <- data.si06
##D 
##D #** estimate 2PL nested logit model
##D library(mirt)
##D mod1 <- mirt::mirt( dat, model=1, itemtype="2PLNRM", key=rep(0,ncol(dat) ),
##D             verbose=TRUE  )
##D summary(mod1)
##D cmod1 <- sirt::mirt.wrapper.coef(mod1)$coef
##D cmod1[,-1] <- round( cmod1[,-1], 3)
##D 
##D #** normalize item parameters according Suh and Bolt (2010)
##D cmod2 <- cmod1
##D 
##D # slope parameters
##D ind <-  grep("ak",colnames(cmod2))
##D h1 <- cmod2[,ind ]
##D cmod2[,ind] <- t( apply( h1, 1, FUN=function(ll){ ll - mean(ll) } ) )
##D # item intercepts
##D ind <-  paste0( "d", 0:9 )
##D ind <- which( colnames(cmod2) %in% ind )
##D h1 <- cmod2[,ind ]
##D cmod2[,ind] <- t( apply( h1, 1, FUN=function(ll){ ll - mean(ll) } ) )
##D cmod2[,-1] <- round( cmod2[,-1], 3)
## End(Not run)



