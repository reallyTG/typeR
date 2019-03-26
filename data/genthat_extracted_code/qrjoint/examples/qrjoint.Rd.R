library(qrjoint)


### Name: qrjoint
### Title: Joint Estimation of Linear Quantile Planes
### Aliases: qrjoint update.qrjoint
### Keywords: programming

### ** Examples
 
## Plasma data analysis

# recoding variables
data(plasma)
plasma$Sex <- as.factor(plasma$Sex)
plasma$SmokStat <- as.factor(plasma$SmokStat)
plasma$VitUse <- 3 - plasma$VitUse
plasma$VitUse <- as.factor(plasma$VitUse)

# Model fitting with 40 posterior samples from 80 iterations (thin = 2) is for
# illustration only. For practical model fitting, increase iterations, 
# e.g. nsamp = 500, thin = 20
fit.qrj <- qrjoint(BetaPlasma ~ Age + Sex + SmokStat + Quetelet + VitUse + Calories + 
        Fat + Fiber + Alcohol + Cholesterol + BetaDiet, plasma, nsamp = 40, thin = 2)
summary(fit.qrj, more = TRUE)

## Not run: 
##D # additional MCMC runs to get 10 more samples (20 additional iterations)
##D fit.qrj <- update(fit.qrj, 10)
##D summary(fit.qrj, more = TRUE)
## End(Not run)

## Not run: 
##D ### UIS data analysis (with right censoring)
##D data(uis)
##D uis.qrj <- qrjoint(Y ~ TREAT + NDT + IV3 + BECK + FRAC + 
##D                        RACE + AGE + SITE , data=uis, cens = (1 - uis$CENSOR), 
##D                      nsamp = 50, thin = 2, fix.nu = 1e5)
##D summary(uis.qrj, more = TRUE)
##D 
##D betas <- coef(uis.qrj, plot = TRUE, col = "darkgreen")
##D tau.grid <- uis.qrj$tau.g[uis.qrj$reg.ix]
##D L <- length(tau.grid)
##D beta.samp <- betas$beta.samp
##D 
##D # survival curve estimation for k randomly chosen subjects
##D n <- nrow(uis)
##D k <- 9
##D ix.sel <- sort(sample(n, k))
##D Qsel.gp <- predict(uis.qrj, newdata=uis[ix.sel,], summarize=FALSE)
##D   
##D colRGB <- col2rgb("darkgreen")/255
##D colTrans <- rgb(colRGB[1], colRGB[2], colRGB[3], alpha = 0.05)
##D par(mfrow = c(3,3), mar = c(4,3,2,1) + .1)
##D for(i in 1:k){
##D   plot(exp(apply(Qsel.gp[i,,],1,mean)), 1 - tau.grid, ty = "n", ann = FALSE, 
##D         bty = "n", xlim = exp(c(2, 8)), ylim = c(0,1), lty = 2, log = "x")
##D   for(j in 1:dim(beta.samp)[3])
##D       lines(exp(Qsel.gp[i,,j]), 1 - tau.grid, col = colTrans, lwd = 1)
##D   title(xlab = "Return time (days)", ylab = "Survival function", line = 2)
##D   title(main = bquote(Obs.Id == .(ix.sel[i])))
##D   grid()  
##D }
## End(Not run)



