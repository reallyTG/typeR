library(SemiParSampleSel)


### Name: SemiParSampleSel
### Title: Semiparametric Sample Selection Modelling with Continuous or
###   Discrete Response
### Aliases: SemiParSampleSel
### Keywords: copula sample selection semiparametric sample selection
###   modelling sample selection model smooth regression spline shrinkage
###   smoother variable selection

### ** Examples


library(SemiParSampleSel)

######################################################################
## Generate data
## Correlation between the two equations and covariate correlation 0.5 
## Sample size 2000 
######################################################################

set.seed(0)

n <- 2000

rhC <- rhU <- 0.5      

SigmaU <- matrix(c(1, rhU, rhU, 1), 2, 2)
U      <- rmvnorm(n, rep(0,2), SigmaU)

SigmaC <- matrix(rhC, 3, 3); diag(SigmaC) <- 1

cov    <- rmvnorm(n, rep(0,3), SigmaC, method = "svd")
cov    <- pnorm(cov)

bi <- round(cov[,1]); x1 <- cov[,2]; x2 <- cov[,3]
  
f11 <- function(x) -0.7*(4*x + 2.5*x^2 + 0.7*sin(5*x) + cos(7.5*x))
f12 <- function(x) -0.4*( -0.3 - 1.6*x + sin(5*x))  
f21 <- function(x) 0.6*(exp(x) + sin(2.9*x)) 

ys <-  0.58 + 2.5*bi + f11(x1) + f12(x2) + U[, 1] > 0
y  <- -0.68 - 1.5*bi + f21(x1) +         + U[, 2]
yo <- y*(ys > 0)
  

dataSim <- data.frame(ys, yo, bi, x1, x2)

## CLASSIC SAMPLE SELECTION MODEL
## the first equation MUST be the selection equation

out <- SemiParSampleSel(list(ys ~ bi + x1 + x2, 
                             yo ~ bi + x1), 
                        data = dataSim)
conv.check(out)
summary(out)

AIC(out)
BIC(out)
aver(out)


## Not run: 
##D  
##D 
##D ## SEMIPARAMETRIC SAMPLE SELECTION MODEL
##D 
##D ## "cr" cubic regression spline basis      - "cs" shrinkage version of "cr"
##D ## "tp" thin plate regression spline basis - "ts" shrinkage version of "tp"
##D ## for smooths of one variable, "cr/cs" and "tp/ts" achieve similar results 
##D ## k is the basis dimension - default is 10
##D ## m is the order of the penalty for the specific term - default is 2
##D 
##D out <- SemiParSampleSel(list(ys ~ bi + s(x1, bs = "tp", k = 10, m = 2) + s(x2), 
##D                              yo ~ bi + s(x1)), 
##D                         data = dataSim)
##D conv.check(out)                        
##D AIC(out)
##D aver(out)
##D 
##D ## compare the two summary outputs
##D ## the second output produces a summary of the results obtained when only 
##D ## the outcome equation is fitted, i.e. selection bias is not accounted for
##D 
##D summary(out)
##D summary(out$gam2)
##D 
##D ## estimated smooth function plots
##D ## the red line is the true curve
##D ## the blue line is the naive curve not accounting for selection bias
##D 
##D x1.s <- sort(x1[dataSim$ys>0])
##D f21.x1 <- f21(x1.s)[order(x1.s)] - mean(f21(x1.s))
##D 
##D plot(out, eq = 2, ylim = c(-1, 0.8)); lines(x1.s, f21.x1, col = "red")
##D par(new = TRUE)
##D plot(out$gam2, se = FALSE, col = "blue", ylim = c(-1, 0.8), ylab = "", rug = FALSE)
##D 
##D 
##D 
##D ## SEMIPARAMETRIC SAMPLE SELECTION MODEL with association and dispersion parameters 
##D ## depending on covariates as well
##D 
##D out <- SemiParSampleSel(list(ys ~ bi + s(x1) + s(x2), 
##D                              yo ~ bi + s(x1),
##D                                 ~ bi, 
##D                                 ~ bi + x1), 
##D                         data = dataSim)
##D conv.check(out)                        
##D summary(out)
##D out$sigma
##D out$theta
##D 
##D #
##D #
##D 
##D ###################################################
##D ## example using Clayton copula with normal margins
##D ###################################################
##D 
##D set.seed(0)
##D 
##D theta <- 5
##D sig  <- 1.5
##D 
##D myCop <- archmCopula(family = "clayton", dim = 2, param = theta)
##D 
##D # other copula options are for instance: "amh", "frank", "gumbel", "joe"
##D # for FGM use the following code:
##D # myCop <- fgmCopula(theta, dim=2)
##D 
##D bivg  <- mvdc(copula = myCop, c("norm", "norm"), 
##D               list(list(mean = 0, sd = 1), 
##D               list(mean = 0, sd = sig)))
##D er    <- rMvdc(n, bivg)
##D 
##D ys <-  0.58 + 2.5*bi + f11(x1) + f12(x2) + er[, 1] > 0
##D y  <- -0.68 - 1.5*bi + f21(x1) +         + er[, 2]
##D yo <- y*(ys > 0)
##D   
##D dataSim <- data.frame(ys, yo, bi, x1, x2)
##D 
##D out <- SemiParSampleSel(list(ys ~ bi + s(x1) + s(x2), 
##D                              yo ~ bi + s(x1)), 
##D                         data = dataSim, BivD = "C0")
##D conv.check(out)
##D summary(out)
##D aver(out)
##D 
##D x1.s <- sort(x1[dataSim$ys>0])
##D f21.x1 <- f21(x1.s)[order(x1.s)] - mean(f21(x1.s))
##D 
##D plot(out, eq = 2, ylim = c(-1.1, 1.6)); lines(x1.s, f21.x1, col = "red")
##D par(new = TRUE)
##D plot(out$gam2, se = FALSE, col = "blue", ylim = c(-1.1, 1.6), ylab = "", rug = FALSE)
##D 
##D #
##D #
##D 
##D ########################################################
##D ## example using Gumbel copula with normal-gamma margins
##D ########################################################
##D 
##D set.seed(0)
##D 
##D k <- 2                                # shape of gamma distribution
##D miu  <- exp(-0.68 - 1.5*bi + f21(x1)) # mean values of y's (log m = Xb)
##D lambda <- k/miu	                      # rate of gamma distribution
##D 
##D theta <- 6
##D 
##D # Two-dimensional Gumbel copula with unif margins
##D gumbel.cop <- onacopula("Gumbel", C(theta, 1:2))
##D 
##D # Random sample from two-dimensional Gumbel copula with uniform margins
##D U <- rnacopula(n = n, gumbel.cop)		  
##D 
##D # Margins: normal and gamma
##D er <- cbind(qnorm(U[,1], 0, 1), qgamma(U[, 2], shape = k, rate = lambda))
##D 
##D ys <- 0.58 + 2.5*bi + f11(x1) + f12(x2) + er[, 1] > 0
##D y  <- er[, 2]
##D yo <- y*(ys > 0)
##D 
##D dataSim <- data.frame(ys, yo, bi, x1, x2)
##D 
##D out <- SemiParSampleSel(list(ys ~ bi + s(x1) + s(x2), 
##D                              yo ~ bi + s(x1)), 
##D                         data = dataSim, BivD = "G0", margins = c("N", "G"))
##D conv.check(out)
##D summary(out)
##D aver(out)
##D 
##D x1.s <- sort(x1[dataSim$ys>0])
##D f21.x1 <- f21(x1.s)[order(x1.s)] - mean(f21(x1.s))
##D 
##D plot(out, eq = 2, ylim = c(-1.1, 1)); lines(x1.s, f21.x1, col = "red")
##D par(new = TRUE)
##D plot(out$gam2, se = FALSE, col = "blue", ylim = c(-1.1, 1), ylab = "", rug = FALSE)
##D 
##D #
##D #
##D 
##D 
##D ########################################################
##D ## Example for discrete margins and normal copula
##D ########################################################
##D 
##D 
##D # Creating simulation function
##D bcds <- function(n, s.tau = 0.2, s.sigma = 1, s.nu = 0.5, 
##D                 rhC = 0.2, outcome.margin = "PO", copula = "FGM")  {
##D   
##D # Generating covariates     
##D   SigmaC <- matrix( c(1,rhC,rhC,rhC,rhC,1,rhC,rhC,rhC,rhC,1,rhC,rhC,rhC,rhC,1), 4 , 4)
##D   covariates    <- rmvnorm(n,rep(0,4),SigmaC, method="svd")
##D   covariates    <- pnorm(covariates)
##D   x1 <- covariates[,1]
##D   x2 <- covariates[,2]
##D   x3 <- round(covariates[,3])
##D   x4 <- round(covariates[,4])
##D   
##D   # Establishing copula object
##D   if (copula == "FGM") {
##D       Cop <- fgmCopula(dim = 2, param = iTau(fgmCopula(), s.tau))
##D     } else if (copula == "N") {
##D       Cop <- ellipCopula(family = "normal", dim = 2, param = iTau(normalCopula(), s.tau))
##D     } else if (copula == "AMH") {
##D       Cop <- archmCopula(family = "amh", dim = 2, param = iTau(amhCopula(), s.tau))
##D     } else if (copula == "C0") {
##D       Cop <- archmCopula(family = "clayton", dim = 2, param = iTau(claytonCopula(), s.tau))
##D     } else if (copula == "F") {
##D       Cop <- archmCopula(family = "frank", dim = 2, param = iTau(frankCopula(), s.tau))
##D     } else if (copula == "G0") {
##D       Cop <- archmCopula(family = "gumbel", dim = 2, param = iTau(gumbelCopula(), s.tau))
##D     } else if (copula == "J0") {
##D       Cop <- archmCopula(family = "joe", dim = 2, param = iTau(joeCopula(), s.tau))
##D     }  
##D   
##D   # Setting up equations
##D   f1 <- function(x) 0.4*(-4 - (5.5*x-2.9) + 3*(4.5*x-2.3)^2 - (4.5*x-2.3)^3)
##D   f2 <- function(x) x*sin(8*x)
##D   mu_s  <- 1.0 + f1(x1) - 2.0*x2 + 3.1*x3 - 2.2*x4
##D   mu_o  <-  exp(1.3 + f2(x1) - 1.9*x2 + 2.4*x3 - 0.1*x4)
##D   
##D   # Creating margin dependent object
##D   if (outcome.margin == "P") {
##D         speclist <- list(mu = mu_o)
##D         outcome.margin2 <- "PO"
##D      } else if (outcome.margin == "NB") {
##D         speclist  <- list(mu = mu_o, sigma = s.sigma)
##D         outcome.margin2 <- "NBI"
##D      } else if (outcome.margin == "D") {
##D         speclist  <- list(mu = mu_o, sigma = s.sigma, nu = s.nu)
##D         outcome.margin2 <- "DEL"
##D      } else if (outcome.margin == "PIG") {
##D         speclist  <- list(mu = mu_o, sigma = s.sigma)
##D         outcome.margin2 <- "PIG"
##D      } else if (outcome.margin == "S") {
##D         speclist  <- list(mu = mu_o, sigma = s.sigma, nu = s.nu)
##D         outcome.margin2 <- "SICHEL"
##D    }
##D   spec  <- mvdc(copula = Cop, c("norm", outcome.margin2), 
##D                 list(list(mean = mu_s, sd = 1), speclist))  
##D   
##D   # Simulating data
##D   simGen <- rMvdc(n, spec)
##D   y <- ifelse(simGen[,1]>0, simGen[,2], -99)
##D   
##D   dataSim <- data.frame(y, x1, x2, x3, x4)  
##D   dataSim  
##D }
##D 
##D 
##D 
##D # Creating plots of the true functional form of x1 in both equations
##D xt1  <- seq(0, 1, length.out=200)
##D xt2  <- seq(0,1, length.out=200)
##D f1t <- function(x) 0.4*(-4 - (5.5*x-2.9) + 3*(4.5*x-2.3)^2 - (4.5*x-2.3)^3)
##D f2t <- function(x) x*sin(8*x)
##D plot(xt1, f1t(xt1))
##D plot(xt2, f2t(xt2))
##D 
##D 
##D 
##D 
##D # Simulating 1000 deviates
##D 
##D set.seed(0)
##D 
##D dataSim<- bcds(1000, s.tau = 0.6, s.sigma = 0.1, s.nu = 0.5, 
##D                 rhC = 0.5, outcome.margin = "NB", copula = "N")
##D dataSim$y.probit<-ifelse(dataSim$y >= 0, 1, 0)
##D 
##D 
##D # Estimating SemiParSampleSel
##D 
##D out1 <- SemiParSampleSel(list(y.probit ~ s(x1) + x2 + x3 + x4, y ~ s(x1) + x2 + x3 + x4), 
##D                           data = dataSim, BivD = "N", margins = c("N", "P")) 
##D conv.check(out1)
##D 
##D out2 <- SemiParSampleSel(list(y.probit ~ s(x1) + x2 + x3 + x4, y ~ s(x1) + x2 + x3 + x4), 
##D                          data = dataSim, BivD = "N", margins = c("N", "NB")) 
##D conv.check(out2)
##D 
##D 
##D # Model comparison
##D 
##D AIC(out1)
##D AIC(out2)
##D VuongClarke(out1, out2)
##D 
##D 
##D # Model diagnostics
##D 
##D summary(out2, cm.plot = TRUE)
##D plot(out2, eq = 1)
##D plot(out2, eq = 2)
##D aver(out2, univariate = TRUE)
##D aver(out2, univariate = FALSE)
##D 
##D #
##D #
##D 
##D 
## End(Not run)




