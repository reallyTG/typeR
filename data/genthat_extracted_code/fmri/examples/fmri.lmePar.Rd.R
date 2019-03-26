library(fmri)


### Name: fmri.lmePar
### Title: Linear Mixed-effects Model for fMRI data
### Aliases: fmri.lmePar
### Keywords: regression

### ** Examples

## Not run: 
##D ## Generate some fMRI data sets: noise + stimulus
##D dx <- dy <- dz <- 32
##D dt <- 107
##D hrf <- fmri.stimulus(dt, c(18, 48, 78), 15, 2)
##D stim <- matrix(hrf, nrow= dx*dy*dz, ncol=dt, byrow=TRUE)
##D mask <- array(FALSE, c(dx, dy, dz))
##D mask[12:22,12:22,12:22] <- TRUE
##D 
##D ds1 <- list(ttt=writeBin(1.0*rnorm(dx*dy*dz*dt) + as.vector(5*stim), 
##D             raw(), 4), mask=mask, dim=c(dx, dy, dz, dt))
##D ds2 <- list(ttt=writeBin(1.7*rnorm(dx*dy*dz*dt) + as.vector(3*stim), 
##D             raw(), 4), mask=mask, dim=c(dx, dy, dz, dt))
##D ds3 <- list(ttt=writeBin(0.8*rnorm(dx*dy*dz*dt) + as.vector(1*stim), 
##D             raw(), 4), mask=mask, dim=c(dx, dy, dz, dt))
##D ds4 <- list(ttt=writeBin(1.2*rnorm(dx*dy*dz*dt) + as.vector(2*stim), 
##D             raw(), 4), mask=mask, dim=c(dx, dy, dz, dt))
##D class(ds1) <- class(ds2) <- class(ds3) <- class(ds4) <- "fmridata"
##D 
##D ## Construct a design matrix for a multi-subject study
##D subj <- 4
##D runs <- 1
##D z <-fmri.designG(hrf, subj = subj, runs = runs)
##D 
##D ## Assembly of the aggregated BOLD-Array
##D Bold <- array(0, dim = c(dx,dy,dz,subj*runs*dt))
##D Bold[1:dx,1:dy,1:dz,1:(dt*1)] <- extract.data(ds1)
##D Bold[1:dx,1:dy,1:dz,(dt*1+1):(dt*2)] <- extract.data(ds2)
##D Bold[1:dx,1:dy,1:dz,(dt*2+1):(dt*3)] <- extract.data(ds3)
##D Bold[1:dx,1:dy,1:dz,(dt*3+1):(dt*4)] <- extract.data(ds4)
##D 
##D ## Step 1: Check the model
##D y <- Bold[16, 16, 16, ] # choose one voxel
##D M1.1 <-  lme(fixed = y ~ 0 + hrf + session + drift1:session + drift2:session,
##D             random = ~ 0 + hrf|subj,           
##D             correlation = corAR1(value = 0.3, form = ~ 1|subj/session, fixed=TRUE),
##D             weights = varIdent(form =~ 1|subj), 
##D             method ="REML",
##D             control = lmeControl(rel.tol=1e-6, returnObject = TRUE),
##D             data = z)
##D summary(M1.1)
##D 
##D # Residual plots
##D plot(M1.1, resid(.,type = "response") ~ scan|subj)
##D qqnorm(M1.1, ~resid(.,type = "normalized")|subj, abline = c(0,1))
##D 
##D # Testing the assumption of homoscedasticity 
##D M1.2 <- update(M1.1, weights = NULL, data = z)
##D anova(M1.2, M1.1) 
##D 
##D # Model fit: observed and fitted values 
##D fitted.values <- fitted(M1.1)
##D plot(y[1:dt], type="l", main = "Subject 1", xlab = "scan", 
##D      ylab = "BOLD-signal", ylim = c(-5,5))
##D lines(fitted.values[names(fitted.values)==1],lty=1,lwd=2)
##D 
##D plot(y[(dt+1):(2*dt)], type="l", main = "Subject 2", xlab = "scan", 
##D      ylab = "BOLD-signal", ylim = c(-5,5))
##D lines(fitted.values[names(fitted.values)==2],lty=1,lwd=2)
##D 
##D plot(y[(2*dt+1):(3*dt)], type="l", main = "Subject 3", xlab = "scan", 
##D      ylab = "BOLD-signal", ylim = c(-5,5))
##D lines(fitted.values[names(fitted.values)==3],lty=1,lwd=2)
##D 
##D plot(y[(3*dt+1):(4*dt)], type="l", main = "Subject 4", xlab = "scan", 
##D      ylab = "BOLD-signal", ylim = c(-5,5))
##D lines(fitted.values[names(fitted.values)==4],lty=1,lwd=2)
##D 
##D ## Step 2: Estimate a group map
##D ## without parallelizing
##D spm.group1a <- fmri.lmePar(Bold, z, mask = mask, cluster = 1)
##D # same with 4 parallel threads
##D spm.group1b <- fmri.lmePar(Bold, z, mask = mask, cluster = 4)
##D ## Example for two independent groups
##D group <- c(1,1,4,4)
##D z2 <- fmri.designG(hrf, subj = subj, runs = runs, group = group)
##D spm.group2 <- fmri.lmePar(Bold, z2, mask = mask, cluster = 4)
## End(Not run)



