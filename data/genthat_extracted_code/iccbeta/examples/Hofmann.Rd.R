library(iccbeta)


### Name: Hofmann
### Title: A multilevel dataset from Hofmann, Griffin, and Gavin (2000).
### Aliases: Hofmann
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D if(requireNamespace("lme4") && requireNamespace("RLRsim")){ 
##D data(Hofmann)
##D library("lme4")
##D 
##D # Random-Intercepts Model
##D lmmHofmann0 = lmer(helping ~ (1|id), data = Hofmann)
##D vy_Hofmann = var(Hofmann[,'helping'])
##D 
##D # Computing icca
##D VarCorr(lmmHofmann0)$id[1,1]/vy_Hofmann
##D 
##D # Estimating Group-Mean Centered Random Slopes Model, no level 2 variables
##D lmmHofmann1  <- lmer(helping ~ mood_grp_cent + (mood_grp_cent |id),
##D                      data = Hofmann, REML = FALSE)
##D X_Hofmann = model.matrix(lmmHofmann1)
##D P = ncol(X_Hofmann)
##D T1_Hofmann  = VarCorr(lmmHofmann1)$id[1:P,1:P]
##D 
##D # Computing iccb
##D icc_beta(X_Hofmann, Hofmann[,'id'], T1_Hofmann, vy_Hofmann)$rho_beta
##D 
##D # Performing LR test
##D # Need to install 'RLRsim' package
##D library("RLRsim")
##D lmmHofmann1a  <- lmer(helping ~ mood_grp_cent + (1 | id),
##D                       data = Hofmann, REML = FALSE)
##D obs.LRT <- 2*(logLik(lmmHofmann1) - logLik(lmmHofmann1a))[1]
##D X <- getME(lmmHofmann1,"X")
##D Z <- t(as.matrix(getME(lmmHofmann1,"Zt")))
##D sim.LRT <- LRTSim(X, Z, 0, diag(ncol(Z)))
##D (pval <- mean(sim.LRT > obs.LRT))
##D } else {
##D  stop("Please install packages `RLRsim` and `lme4` to run the above example.")
##D }
## End(Not run)



