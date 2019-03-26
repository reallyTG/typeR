library(mixAK)


### Name: NMixMCMC
### Title: MCMC estimation of (multivariate) normal mixtures with possibly
###   censored data.
### Aliases: NMixMCMC print.NMixMCMC print.NMixMCMClist C_NMix_MCMC
###   C_NMix_PED
### Keywords: multivariate survival

### ** Examples

## Not run: 
##D ## See also additional material available in 
##D ## YOUR_R_DIR/library/mixAK/doc/
##D ## or YOUR_R_DIR/site-library/mixAK/doc/
##D ## - files Galaxy.R, Faithful.R, Tandmob.R and
##D ## http://www.karlin.mff.cuni.cz/~komarek/software/mixAK/Galaxy.pdf
##D ## http://www.karlin.mff.cuni.cz/~komarek/software/mixAK/Faithful.pdf
##D ## http://www.karlin.mff.cuni.cz/~komarek/software/mixAK/Tandmob.pdf
##D ##
##D 
##D ## ==============================================
##D 
##D ## Simple analysis of Anderson's iris data
##D ## ==============================================
##D library("colorspace")
##D 
##D data(iris, package="datasets")
##D summary(iris)
##D VARS <- names(iris)[1:4]
##D #COLS <- rainbow_hcl(3, start = 60, end = 240)
##D COLS <- c("red", "darkblue", "darkgreen")
##D names(COLS) <- levels(iris[, "Species"])
##D 
##D ### Prior distribution and the length of MCMC
##D Prior <- list(priorK = "fixed", Kmax = 3)
##D nMCMC <- c(burn=5000, keep=10000, thin=5, info=1000)
##D 
##D ### Run MCMC
##D set.seed(20091230)
##D fit <- NMixMCMC(y0 = iris[, VARS], prior = Prior, nMCMC = nMCMC)
##D 
##D ### Basic posterior summary
##D print(fit)
##D 
##D ### Univariate marginal posterior predictive densities
##D ### based on chain #1
##D pdens1 <- NMixPredDensMarg(fit[[1]], lgrid=150)
##D plot(pdens1)
##D plot(pdens1, main=VARS, xlab=VARS)
##D 
##D ### Bivariate (for each pair of margins) predictive densities
##D ### based on chain #1
##D pdens2a <- NMixPredDensJoint2(fit[[1]])
##D plot(pdens2a)
##D 
##D plot(pdens2a, xylab=VARS)
##D plot(pdens2a, xylab=VARS, contour=TRUE)
##D 
##D ### Determine the grid to compute bivariate densities
##D grid <- list(Sepal.Length=seq(3.5, 8.5, length=75),
##D              Sepal.Width=seq(1.8, 4.5, length=75),
##D              Petal.Length=seq(0, 7, length=75),
##D              Petal.Width=seq(-0.2, 3, length=75))
##D pdens2b <- NMixPredDensJoint2(fit[[1]], grid=grid)
##D plot(pdens2b, xylab=VARS)
##D 
##D ### Plot with contours
##D ICOL <- rev(heat_hcl(20, c=c(80, 30), l=c(30, 90), power=c(1/5, 2)))
##D oldPar <- par(mfrow=c(2, 3), bty="n")
##D for (i in 1:3){
##D   for (j in (i+1):4){
##D     NAME <- paste(i, "-", j, sep="")
##D     MAIN <- paste(VARS[i], "x", VARS[j])
##D     image(pdens2b$x[[i]], pdens2b$x[[j]], pdens2b$dens[[NAME]], col=ICOL,
##D           xlab=VARS[i], ylab=VARS[j], main=MAIN)
##D     contour(pdens2b$x[[i]], pdens2b$x[[j]], pdens2b$dens[[NAME]], add=TRUE, col="brown4")
##D   }  
##D }  
##D 
##D ### Plot with data
##D for (i in 1:3){
##D   for (j in (i+1):4){
##D     NAME <- paste(i, "-", j, sep="")
##D     MAIN <- paste(VARS[i], "x", VARS[j])
##D     image(pdens2b$x[[i]], pdens2b$x[[j]], pdens2b$dens[[NAME]], col=ICOL,
##D           xlab=VARS[i], ylab=VARS[j], main=MAIN)
##D     for (spec in levels(iris[, "Species"])){
##D       Data <- subset(iris, Species==spec)
##D       points(Data[,i], Data[,j], pch=16, col=COLS[spec])
##D     }  
##D   }  
##D }  
##D 
##D ### Set the graphical parameters back to their original values
##D par(oldPar)
##D 
##D ### Clustering based on posterior summary statistics of component allocations
##D ### or on the posterior distribution of component allocations
##D ### (these are two equivalent estimators of probabilities of belonging
##D ###  to each mixture components for each observation)
##D p1 <- fit[[1]]$poster.comp.prob_u
##D p2 <- fit[[1]]$poster.comp.prob_b
##D 
##D ### Clustering based on posterior summary statistics of mixture weight, means, variances
##D p3 <- NMixPlugDA(fit[[1]], iris[, VARS])
##D p3 <- p3[, paste("prob", 1:3, sep="")]
##D 
##D   ### Observations from "setosa" species (all would be allocated in component 1)
##D apply(p1[1:50,], 2, quantile, prob=seq(0, 1, by=0.1))
##D apply(p2[1:50,], 2, quantile, prob=seq(0, 1, by=0.1))
##D apply(p3[1:50,], 2, quantile, prob=seq(0, 1, by=0.1))
##D 
##D   ### Observations from "versicolor" species (almost all would be allocated in component 2)
##D apply(p1[51:100,], 2, quantile, prob=seq(0, 1, by=0.1))
##D apply(p2[51:100,], 2, quantile, prob=seq(0, 1, by=0.1))
##D apply(p3[51:100,], 2, quantile, prob=seq(0, 1, by=0.1))
##D 
##D   ### Observations from "virginica" species (all would be allocated in component 3)
##D apply(p1[101:150,], 2, quantile, prob=seq(0, 1, by=0.1))
##D apply(p2[101:150,], 2, quantile, prob=seq(0, 1, by=0.1))
##D apply(p3[101:150,], 2, quantile, prob=seq(0, 1, by=0.1))
## End(Not run)



