library(dynamo)


### Name: fitmodel
### Title: Sparse Estimation of Dynamical Array Models
### Aliases: fitmodel
### Keywords: package

### ** Examples

## Not run: 
##D # Example showcasing the application from Lund and Hansen (2018).
##D ############################### data  
##D data(V)
##D ############################### constants 
##D Nx <- dim(V)[1]
##D Ny <- dim(V)[2]
##D Nt <- dim(V)[3]
##D L <- 50          #lag length in steps
##D Lp1 <- L + 1     #number of lag time points (= initial points)
##D t0 <- 0
##D M <- Nt - Lp1      #number of modelled time points
##D sl <- floor(200 / 0.6136) - 0 + 1   #stim start counted from -tau
##D sr <- sl + floor(250 / 0.6136)  #stim end counted from -tau
##D ##no. of basis func.
##D px <- 8
##D py <- 8
##D pl <- max(ceiling(Lp1 / 5), 4)
##D pt <- max(ceiling((Nt - sl) / 25), 4)
##D degx <- 2
##D degy <- 2
##D degl <- 3
##D degt <- 3
##D ############################### basis functions
##D library(MortalitySmooth)
##D phix <- round(MortSmooth_bbase(x = 1:Nx, xl = 1, xr = Nx, ndx = px - degx, deg = degx), 10)
##D phiy <- round(MortSmooth_bbase(x = 1:Ny, xl = 1, xr = Ny, ndx = py - degy, deg = degy), 10)
##D phil <- round(MortSmooth_bbase(x = -tau:(t0 - 1), xl = -tau, xr = (t0 - 1), 
##D ndx = pl - degl, deg = degl), 10)
##D phit <- round(MortSmooth_bbase(x = sl:Nt, xl = sl, xr = Nt, ndx = pt - degt, deg = degt), 10)
##D phit <- rbind(matrix(0,  (sl - 1) - Lp1, dim(phit)[2]), phit)
##D ############################### penalty weights  
##D wt <- c(1, 1, 2, 2, 3, 3, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 3, 3, 3, 2, 1, 1)
##D penSlist <- list(matrix(1,  px,  py), matrix(1 / wt, dim(phit)[2], 1))
##D penF <- array(1, c(px, py, px * py * pl))
##D penH <- matrix(1, px, py)
##D penaltyfactor <- list(penSlist, penF, penH)
##D ############################### run algorithm
##D system.time({Fit <- fitmodel(V,
##D                              phix, phiy, phil, phit,
##D                              penaltyfactor, 
##D                              nlambda = 10,
##D                              lambdaminratio = 10^-1,
##D                              reltolinner = 10^-4,
##D                              reltola = 10^-4,
##D                              maxalt = 10)})
##D                               
##D ###############################  get one fit
##D modelno <- 6
##D fit <- Fit[[1]]
##D A <- array(fit$BetaS[, modelno], c(px, py, pt))
##D B <- array(fit$BetaF[, modelno], c(px, py, px * py * pl))
##D C <- array(fit$BetaH[, modelno], c(px, py))
##D shat <- RH(phit, RH(phiy, RH(phix, A)))
##D beta <- array(B, c(px, py, px, py, pl))
##D what <- RH(phil, RH(phiy, RH(phix, RH(phiy, RH(phix, beta)))))
##D ############################### compute summary network quantities
##D wbar <- apply(abs(what), c(1, 2, 3, 4), sum)
##D win <- apply(wbar, c(1, 2), sum)  
##D wout <- apply(wbar, c(3, 4), sum) 
##D indeg <- apply((what != 0), c(1, 2), sum)
##D outdeg <- apply((what != 0), c(3, 4), sum)
##D winnorm <- ifelse(indeg > 0, win / indeg, win)
##D woutnorm <- ifelse(outdeg > 0, wout / outdeg, wout)
##D ############################### plot summary network quantities
##D par(mfrow = c(2, 2), oma = c(0, 0 ,1, 0), mar = c(0, 0, 1, 0))
##D image(winnorm, main = paste("Time aggregated in effects"), axes = FALSE)
##D image(woutnorm, main = paste("Time aggregated out effects"), axes = FALSE)
##D timepoint <- which(shat[9, 9, ] == min(shat[9, 9, ]))
##D image(shat[,, timepoint], axes = FALSE, main = "Stimulus function")
##D plot(shat[1, 1, ], ylim = range(shat), type="l", main = "Stimulus function")
##D for(i in 1:Nx){for(j in 1:Ny){lines(shat[i, j, ])}}
##D abline(v = sl - Lp1, lty = 2)
##D abline(v = sr - Lp1, lty = 2)
## End(Not run)



