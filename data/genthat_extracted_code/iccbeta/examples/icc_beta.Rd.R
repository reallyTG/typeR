library(iccbeta)


### Name: icc_beta
### Title: Intraclass correlation used to assess variability of lower-order
###   relationships across higher-order processes/units.
### Aliases: icc_beta

### ** Examples

## Not run: 
##D 
##D if(requireNamespace("lme4") && requireNamespace("RLRsim")){ 
##D # Simulated Data Example from Aguinis & Culpepper (2015)
##D data(simICCdata)
##D library("lme4")
##D     
##D # Computing icca
##D vy <- var(simICCdata$Y)
##D lmm0 <- lmer(Y ~ (1 | l2id), data = simICCdata, REML = FALSE)
##D VarCorr(lmm0)$l2id[1, 1]/vy
##D 
##D # Create simICCdata2
##D grp_means = aggregate(simICCdata[c('X1', 'X2')], simICCdata['l2id'], mean)
##D colnames(grp_means)[2:3] = c('m_X1', 'm_X2')
##D simICCdata2 = merge(simICCdata, grp_means, by='l2id')
##D         
##D # Estimating random slopes model
##D lmm1  <- lmer(Y ~ I(X1-m_X1) + I(X2-m_X2) + (I(X1-m_X1) + I(X2-m_X2) | l2id),
##D                       data = simICCdata2, REML = FALSE)
##D X <- model.matrix(lmm1)
##D p <- ncol(X)
##D T1  <- VarCorr(lmm1)$l2id[1:p,1:p]
##D 
##D # Computing iccb
##D # Notice '+1' because icc_beta assumes l2ids are from 1 to 30.
##D icc_beta(X, simICCdata2$l2id+1, T1, vy)$rho_beta
##D             
##D # Hofmann et al. (2000) Example
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
##D lmmHofmann1 <- lmer(helping ~ mood_grp_cent + (mood_grp_cent |id),
##D                     data = Hofmann, REML = FALSE)
##D X_Hofmann <- model.matrix(lmmHofmann1)
##D P <- ncol(X_Hofmann)
##D T1_Hofmann <- VarCorr(lmmHofmann1)$id[1:P,1:P]
##D 
##D # Computing iccb
##D icc_beta(X_Hofmann, Hofmann[,'id'], T1_Hofmann, vy_Hofmann)$rho_beta
##D                         
##D # Performing LR test
##D library("RLRsim")
##D lmmHofmann1a <- lmer(helping ~ mood_grp_cent + (1 |id), 
##D                      data = Hofmann, REML = FALSE)
##D obs.LRT <- 2*(logLik(lmmHofmann1) - logLik(lmmHofmann1a))[1]
##D X <- getME(lmmHofmann1,"X")
##D Z <- t(as.matrix(getME(lmmHofmann1,"Zt")))
##D sim.LRT <- LRTSim(X, Z, 0, diag(ncol(Z)))
##D (pval <- mean(sim.LRT > obs.LRT))
##D } else {
##D  stop("Please install packages `RLRsim` and `lme4` to run the above example.")
##D }
## End(Not run)  



