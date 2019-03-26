library(TAM)


### Name: tam.modelfit
### Title: Model Fit Statistics in 'TAM'
### Aliases: tam.modelfit summary.tam.modelfit IRT.modelfit.tam.mml
###   IRT.modelfit.tam.mml.3pl IRT.modelfit.tamaan
###   summary.IRT.modelfit.tam.mml summary.IRT.modelfit.tam.mml.3pl
###   summary.IRT.modelfit.tamaan tam.modelfit.IRT tam.modelfit.args tam.Q3
###   summary.tam.Q3
### Keywords: Q3 statistic Model fit summary

### ** Examples

#############################################################################
# EXAMPLE 1: data.cqc01
#############################################################################

data(data.cqc01)
dat <- data.cqc01

#*****************************************************
#*** Model 1: Rasch model
mod1 <- TAM::tam.mml( dat )
# assess model fit
res1 <- TAM::tam.modelfit( tamobj=mod1 )
summary(res1)
# display item pairs with five largest adjusted Q3 statistics
res1$stat.itempair[1:5,c("item1","item2","aQ3","p","p.holm")]

## Not run: 
##D # IRT.modelfit
##D fmod1 <- IRT.modelfit(mod1)
##D summary(fmod1)
##D 
##D #*****************************************************
##D #*** Model 2: 2PL model
##D mod2 <- TAM::tam.mml.2pl( dat )
##D # IRT.modelfit
##D fmod2 <- IRT.modelfit(mod2)
##D summary(fmod2)
##D 
##D # model comparison
##D IRT.compareModels(fmod1, fmod2 )
##D 
##D #############################################################################
##D # SIMULATED EXAMPLE 2: Rasch model
##D #############################################################################
##D 
##D set.seed(8766)
##D N <- 1000    # number of persons
##D I <- 20      # number of items
##D # simulate responses
##D library(sirt)
##D dat <- sirt::sim.raschtype( rnorm(N), b=seq(-1.5,1.5,len=I) )
##D #*** estimation
##D mod1 <- TAM::tam.mml( dat )
##D summary(dat)
##D #*** model fit
##D res1 <- TAM::tam.modelfit( tamobj=mod1)
##D summary(res1)
##D 
##D #############################################################################
##D # EXAMPLE 3: Model fit data.gpcm | Partial credit model
##D #############################################################################
##D 
##D data(data.gpcm)
##D dat <- data.gpcm
##D 
##D # estimate partial credit model
##D mod1 <- TAM::tam.mml( dat)
##D summary(mod1)
##D 
##D # assess model fit
##D tmod1 <- TAM::tam.modelfit( mod1 )
##D summary(tmod1)
##D 
##D #############################################################################
##D # EXAMPLE 4: data.read | Comparison Q3 statistic
##D #############################################################################
##D 
##D library(sirt)
##D data(data.read, package="sirt")
##D dat <- data.read
##D 
##D #**** Model 1: 1PL model
##D mod1 <- TAM::tam.mml( dat )
##D summary(mod1)
##D 
##D #**** Model 2: 2PL model
##D mod2 <- TAM::tam.mml.2pl( dat )
##D summary(mod2)
##D 
##D #**** assess model fits
##D # Q3 based on posterior
##D fmod1 <- TAM::tam.modelfit(mod1)
##D fmod2 <- TAM::tam.modelfit(mod2)
##D # Q3 based on WLEs
##D q3_mod1 <- TAM::tam.Q3(mod1)
##D q3_mod2 <- TAM::tam.Q3(mod2)
##D summary(fmod1)
##D summary(fmod2)
##D summary(q3_mod1)
##D summary(q3_mod2)
## End(Not run)



