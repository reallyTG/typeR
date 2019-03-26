library(sirt)


### Name: likelihood.adjustment
### Title: Adjustment and Approximation of Individual Likelihood Functions
### Aliases: likelihood.adjustment
### Keywords: Likelihood adjustment

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Adjustment of the likelihood | data.read
##D #############################################################################
##D 
##D library(CDM)
##D library(TAM)
##D data(data.read)
##D dat <- data.read
##D 
##D # define theta grid
##D theta.k <- seq(-6,6,len=41)
##D 
##D #*** Model 1: fit Rasch model in TAM
##D mod1 <- TAM::tam.mml( dat, control=list( nodes=theta.k) )
##D summary(mod1)
##D 
##D #*** Model 2: fit Rasch copula model
##D testlets <- substring( colnames(dat), 1, 1 )
##D mod2 <- sirt::rasch.copula2( dat, itemcluster=testlets, theta.k=theta.k)
##D summary(mod2)
##D 
##D # model comparison
##D IRT.compareModels( mod1, mod2 )
##D 
##D # extract EAP reliabilities
##D rel1 <- mod1$EAP.rel
##D rel2 <- mod2$EAP.Rel
##D # variance inflation factor
##D vif <- (1-rel2) / (1-rel1)
##D   ##  > vif
##D   ##  [1] 1.211644
##D 
##D # extract individual likelihood
##D like1 <- IRT.likelihood( mod1 )
##D # adjust likelihood from Model 1 to obtain a target EAP reliability of .599
##D like1b <- sirt::likelihood.adjustment( like1, target.EAP.rel=.599 )
##D 
##D # compare estimated latent regressions
##D lmod1a <- TAM::tam.latreg( like1, Y=NULL )
##D lmod1b <- TAM::tam.latreg( like1b, Y=NULL )
##D summary(lmod1a)
##D summary(lmod1b)
## End(Not run)



