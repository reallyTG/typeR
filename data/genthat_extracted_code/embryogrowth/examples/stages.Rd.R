library(embryogrowth)


### Name: stages
### Title: Database of of embryonic development and thermosensitive period
###   of development for sex determination
### Aliases: stages
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(stages)
##D names(stages)
##D levels(as.factor(stages$Species))
##D # Version of database
##D stages$Version[1]
##D kaska99.SCL <- subset(stages, subset=(Species == "Caretta caretta"), 
##D          select=c("Stage", "SCL_Mean_mm", "SCL_SD_mm", "Days_Begin", "Days_End"))
##D 
##D kaska99.SCL[kaska99.SCL$Stage==31, "Days_Begin"] <- 51
##D kaska99.SCL[kaska99.SCL$Stage==31, "Days_End"] <- 62
##D kaska99.SCL <- na.omit(kaska99.SCL)
##D kaska99.SCL[which(kaska99.SCL$Stage==31), "Stage"] <- c("31a", "31b", "31c")
##D kaska99.SCL <- cbind(kaska99.SCL, 
##D                      Days_Mean=(kaska99.SCL[, "Days_Begin"]+kaska99.SCL[, "Days_End"])/2)
##D kaska99.SCL <- cbind(kaska99.SCL, 
##D                      Days_SD=(kaska99.SCL[, "Days_End"]-kaska99.SCL[, "Days_Begin"])/4)
##D Gompertz <- function(x, par) {
##D    K <- par["K"]
##D    rT <- par["rT"]
##D    X0 <- par["X0"]
##D    y <- abs(K)*exp(log(abs(X0)/abs(K))*exp(-rT*x))
##D    return(y)
##D  }
##D 
##D ML.Gompertz <- function(x, par) {
##D   par <- abs(par)
##D   y <- Gompertz(x, par)
##D   return(sum(-dnorm(y, mean=kaska99.SCL[, "SCL_Mean_mm"], 
##D                     sd=kaska99.SCL[, "SCL_SD_mm"], log=TRUE)))
##D }
##D 
##D parIni <- structure(c(48.66977358, 0.06178453, 0.38640902), 
##D                    .Names = c("K", "rT", "X0"))
##D 
##D fitsize.SCL <- optim(parIni, ML.Gompertz, x=kaska99.SCL[, "Days_Mean"], hessian = TRUE)
##D 
##D # Estimation of standard error of parameters using Hessian matrix
##D sqrt(diag(solve(fitsize.SCL$hessian)))
##D 
##D # Estimation of standard error of parameters using Bayesian  concept and MCMC
##D pMCMC <- structure(list(Density = c("dunif", "dunif", "dunif"), 
##D                         Prior1 = c(0, 0, 0), Prior2 = c(90, 1, 2), 
##D                         SDProp = c(1, 1, 1), 
##D                         Min = c(0, 0, 0), Max = c(90, 1, 2), 
##D                         Init = fitsize.SCL$par), 
##D                    .Names = c("Density", "Prior1", "Prior2", "SDProp", "Min", "Max", "Init"), 
##D                    row.names = c("K", "rT", "X0"), class = "data.frame")
##D 
##D Bayes.Gompertz <- function(data, x) {
##D   x <- abs(x)
##D   y <- Gompertz(data, x)
##D   return(sum(-dnorm(y, mean=kaska99.SCL[, "SCL_Mean_mm"], 
##D                     sd=kaska99.SCL[, "SCL_SD_mm"], log=TRUE)))
##D }
##D 
##D mcmc_run <- MHalgoGen(n.iter=50000, parameters=pMCMC, data=kaska99.SCL[, "Days_Mean"], 
##D                      likelihood=Bayes.Gompertz, n.chains=1, n.adapt=100, thin=1, trace=1, 
##D                       adaptive = TRUE)
##D 
##D plot(mcmc_run, xlim=c(0, 90), parameters="K")
##D plot(mcmc_run, xlim=c(0, 1), parameters="rT")
##D plot(mcmc_run, xlim=c(0, 2), parameters="X0")
##D 
##D 1-rejectionRate(as.mcmc(mcmc_run))
##D 
##D par <- mcmc_run$resultMCMC[[1]]
##D 
##D outsp <- t(apply(par, MARGIN = 1, FUN=function(x) Gompertz(0:70, par=x)))
##D 
##D rangqtiles <- apply(outsp, MARGIN=2, function(x) {quantile(x, probs=c(0.025, 0.5, 0.975))})
##D 
##D par(mar=c(4, 4, 2, 1))
##D plot_errbar(x=kaska99.SCL[, "Days_Mean"], y=kaska99.SCL[, "SCL_Mean_mm"], 
##D             errbar.y = 2*kaska99.SCL[, "SCL_SD_mm"], bty="n", las=1, 
##D             ylim=c(0, 50), xlab="Days", ylab="SCL mm", 
##D            xlim=c(0, 70), x.plus = kaska99.SCL[, "Days_End"], 
##D             x.minus = kaska99.SCL[, "Days_Begin"])
##D 
##D lines(0:70, rangqtiles["2.5%", ], lty=2)
##D lines(0:70, rangqtiles["97.5%", ], lty=2)
##D lines(0:70, rangqtiles["50%", ], lty=3)
##D 
##D text(x=50, y=10, pos=4, labels=paste("K=", format(x = fitsize.SCL$par["K"], digits = 4)))
##D text(x=50, y=12.5, pos=4, 
##D    labels=paste("rK=", format(x = fitsize.SCL$par["K"]/39.33, digits = 4)))
##D text(x=50, y=15, pos=4, labels=paste("X0=", format(x = fitsize.SCL$par["X0"], digits = 4)))
##D title("Univariate normal distribution")
##D 
##D # Using a multivariate normal distribution
##D 
##D library(mvtnorm)
##D 
##D  ML.Gompertz.2D <- function(x, par) {
##D    par <- abs(par)
##D   y <- Gompertz(x, par)
##D   L <- 0
##D   for (i in seq_along(y)) {
##D     sigma <- matrix(c(kaska99.SCL$SCL_SD_mm[i]^2, 0, 0, kaska99.SCL$Days_SD[i]^2), 
##D                     nrow=2, byrow=TRUE, 
##D                     dimnames=list(c("SCL_SD_mm", "Days_SD"), c("SCL_SD_mm", "Days_SD")))
##D     L <- L -dmvnorm(x=c(SCL_SD_mm=kaska99.SCL$SCL_Mean_mm[i], 
##D                     Days_SD=kaska99.SCL$Days_Mean[i]), 
##D                     mean= c(SCL_SD_mm=y[i], Days_SD=kaska99.SCL$Days_Mean[i]), 
##D                             sigma=sigma, log=TRUE)
##D   }
##D   return(L)
##D }
##D 
##D parIni <- structure(c(48.66977358, 0.06178453, 0.38640902), 
##D                     .Names = c("K", "rT", "X0"))
##D 
##D fitsize.SCL.2D <- optim(parIni, ML.Gompertz.2D, x=kaska99.SCL[, "Days_Mean"], hessian = TRUE)
##D 
##D # Estimation of standard error of parameters using Hessian matrix
##D sqrt(diag(solve(fitsize.SCL.2D$hessian)))
##D 
##D # Estimation of standard error of parameters using Bayesian  concept and MCMC
##D Bayes.Gompertz.2D <- function(data, x) {
##D   x <- abs(x)
##D   y <- Gompertz(data, x)
##D   L <- 0
##D   for (i in seq_along(y)) {
##D     sigma <- matrix(c(kaska99.SCL$SCL_SD_mm[i]^2, 0, 0, kaska99.SCL$Days_SD[i]^2), 
##D                     nrow=2, byrow=TRUE, 
##D                     dimnames=list(c("SCL_SD_mm", "Days_SD"), c("SCL_SD_mm", "Days_SD")))
##D     L <- L - dmvnorm(x=c(SCL_SD_mm=kaska99.SCL$SCL_Mean_mm[i], 
##D                          Days_SD=kaska99.SCL$Days_Mean[i]), 
##D                     mean= c(SCL_SD_mm=y[i], Days_SD=kaska99.SCL$Days_Mean[i]), 
##D                     sigma=sigma, log=TRUE)
##D   }
##D   return(L)
##D }
##D 
##D pMCMC <- structure(list(Density = c("dunif", "dunif", "dunif"), 
##D                         Prior1 = c(0, 0, 0), Prior2 = c(90, 1, 2), 
##D                         SDProp = c(1, 1, 1), 
##D                         Min = c(0, 0, 0), Max = c(90, 1, 2), 
##D                         Init = fitsize.SCL.2D$par), 
##D                    .Names = c("Density", "Prior1", "Prior2", "SDProp", "Min", "Max", "Init"), 
##D                    row.names = c("K", "rT", "X0"), class = "data.frame")
##D mcmc_run.2D <- MHalgoGen(n.iter=50000, parameters=pMCMC, data=kaska99.SCL[, "Days_Mean"], 
##D                      likelihood=Bayes.Gompertz.2D, n.chains=1, n.adapt=100, thin=1, trace=1, 
##D                       adaptive = TRUE)
##D 
##D plot(mcmc_run.2D, xlim=c(0, 90), parameters="K")
##D plot(mcmc_run.2D, xlim=c(0, 1), parameters="rT")
##D plot(mcmc_run.2D, xlim=c(0, 2), parameters="X0")
##D 
##D 1-rejectionRate(as.mcmc(mcmc_run.2D))
##D 
##D par <- mcmc_run.2D$resultMCMC[[1]]
##D 
##D outsp <- t(apply(par, MARGIN = 1, FUN=function(x) Gompertz(0:70, par=x)))
##D 
##D rangqtiles <- apply(outsp, MARGIN=2, function(x) {quantile(x, probs=c(0.025, 0.5, 0.975))})
##D 
##D par(mar=c(4, 4, 2, 1))
##D plot_errbar(x=kaska99.SCL[, "Days_Mean"], y=kaska99.SCL[, "SCL_Mean_mm"], 
##D             errbar.y = 2*kaska99.SCL[, "SCL_SD_mm"], bty="n", las=1, 
##D             ylim=c(0, 50), xlab="Days", ylab="SCL mm", 
##D            xlim=c(0, 70), x.plus = kaska99.SCL[, "Days_End"], 
##D             x.minus = kaska99.SCL[, "Days_Begin"])
##D 
##D lines(0:70, rangqtiles["2.5%", ], lty=2)
##D lines(0:70, rangqtiles["97.5%", ], lty=2)
##D lines(0:70, rangqtiles["50%", ], lty=3)
##D 
##D text(x=50, y=10, pos=4, 
##D      labels=paste("K=", format(x = fitsize.SCL.2D$par["K"], digits = 4)))
##D text(x=50, y=12.5, pos=4, 
##D      labels=paste("rK=", format(x = fitsize.SCL.2D$par["K"]/39.33, digits = 4)))
##D text(x=50, y=15, pos=4, 
##D      labels=paste("X0=", format(x = fitsize.SCL.2D$par["X0"], digits = 4)))
##D title("Multivariate normal distribution")
##D 
## End(Not run)



