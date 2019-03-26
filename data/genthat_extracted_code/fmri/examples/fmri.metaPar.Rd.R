library(fmri)


### Name: fmri.metaPar
### Title: Linear Mixed-effects Meta-Analysis model for fMRI data
### Aliases: fmri.metaPar
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
##D            raw(), 4), mask = mask, dim = c(dx, dy, dz, dt))
##D ds2 <- list(ttt=writeBin(1.7*rnorm(dx*dy*dz*dt) + as.vector(3*stim), 
##D            raw(), 4), mask = mask, dim = c(dx, dy, dz, dt))
##D ds3 <- list(ttt=writeBin(0.8*rnorm(dx*dy*dz*dt) + as.vector(1*stim), 
##D            raw(), 4), mask = mask, dim = c(dx, dy, dz, dt))
##D ds4 <- list(ttt=writeBin(1.2*rnorm(dx*dy*dz*dt) + as.vector(2*stim), 
##D            raw(), 4), mask = mask, dim = c(dx, dy, dz, dt))
##D class(ds1) <- class(ds2) <- class(ds3) <- class(ds4) <- "fmridata"
##D 
##D ## Stage 1: single-session regression analysis
##D x <- fmri.design(hrf, order=2)
##D spm.sub01 <- fmri.lm(ds1, x, mask, actype = "smooth", verbose = TRUE)
##D spm.sub02 <- fmri.lm(ds2, x, mask, actype = "smooth", verbose = TRUE) 
##D spm.sub03 <- fmri.lm(ds3, x, mask, actype = "smooth", verbose = TRUE) 
##D spm.sub04 <- fmri.lm(ds4, x, mask, actype = "smooth", verbose = TRUE) 
##D 
##D ## Store observed individual BOLD effects and their variance estimates
##D subj <- 4
##D Cbold <- array(0, dim = c(dx, dy, dz, subj))
##D Cbold[,,,1] <- spm.sub01$cbeta
##D Cbold[,,,2] <- spm.sub02$cbeta
##D Cbold[,,,3] <- spm.sub03$cbeta
##D Cbold[,,,4] <- spm.sub04$cbeta
##D 
##D Vbold <- array(0, dim = c(dx, dy, dz, subj))
##D Vbold[,,,1] <- spm.sub01$var
##D Vbold[,,,2] <- spm.sub02$var
##D Vbold[,,,3] <- spm.sub03$var
##D Vbold[,,,4] <- spm.sub04$var
##D 
##D ## Stage 2: Random-effects meta-regression analysis
##D ## a) Check your model
##D library(metafor)
##D M1.1 <- rma.uni(Cbold[16,16,16, ], 
##D                 Vbold[16,16,16, ],
##D                 method = "REML",
##D                 weighted = TRUE,
##D                 knha = TRUE,
##D                 verbose = TRUE,
##D                 control = list(stepadj=0.5, maxiter=2000, threshold=0.001))
##D 
##D # Control list contains convergence parameters later used 
##D # at whole data cube. Values were adjusted to fMRI data.
##D 
##D summary(M1.1)
##D forest(M1.1)
##D qqnorm(M1.1)
##D 
##D ## b) Estimate a group map
##D ## without parallelizing
##D spm.group1a <- fmri.metaPar(Cbold, Vbold, knha = TRUE, 
##D                             mask = mask, cluster = 1)
##D ## same with 4 parallel threads
##D spm.group1b <- fmri.metaPar(Cbold, Vbold, knha = TRUE, 
##D                             mask = mask, cluster = 4)
## End(Not run)



