library(iccbeta)


### Name: simICCdata
### Title: Simulated data example from Aguinis and Culpepper (2015).
### Aliases: simICCdata
### Keywords: datasets

### ** Examples

## Not run: 
##D data(simICCdata)
##D if(requireNamespace("lme4")){ 
##D library("lme4")
##D 
##D # computing icca
##D vy <- var(simICCdata$Y)
##D lmm0 <- lmer(Y ~ (1|l2id), data = simICCdata, REML = FALSE)
##D VarCorr(lmm0)$l2id[1,1]/vy
##D 
##D # Create simICCdata2
##D grp_means = aggregate(simICCdata[c('X1','X2')], simICCdata['l2id'],mean)
##D colnames(grp_means)[2:3] = c('m_X1','m_X2')
##D simICCdata2 = merge(simICCdata, grp_means, by='l2id')
##D 
##D # Estimating random slopes model
##D lmm1  <- lmer(Y ~ I(X1-m_X1) + I(X2-m_X2) + (I(X1-m_X1) + I(X2-m_X2) | l2id),
##D               data = simICCdata2, REML = FALSE)
##D X <- model.matrix(lmm1)
##D p <- ncol(X)
##D T1 <- VarCorr(lmm1) $l2id[1:p,1:p]
##D # computing iccb
##D # Notice '+1' because icc_beta assumes l2ids are from 1 to 30.
##D icc_beta(X, simICCdata2$l2id+1, T1, vy)$rho_beta
##D } else {
##D  stop("Please install `lme4` to run the above example.")
##D }
## End(Not run)



