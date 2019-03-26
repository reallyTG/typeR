library(cents)


### Name: NiagaraToxic
### Title: Successive readings of a toxic substance in the Niagara River
###   near Fort Erie, Ontario.
### Aliases: NiagaraToxic
### Keywords: datasets

### ** Examples

data(NiagaraToxic)
head(NiagaraToxic)

#Example from thesis
## Not run: 
##D #Diagnostic checks and bootstrap confidence intervals
##D Zdf <- NiagaraTmeans <- apply(A, MARGIN=2, fun=mean)oxic
##D z <- log(Zdf$toxic)
##D iz <- c("o", "L")[1+Zdf$cQ]
##D #
##D #CENARMA(1,1) 
##D cenarma(z, iz, p=1, q=1)
##D #fit CENAR(1)
##D cenarma(z, iz, p=1)
##D #
##D #diagnostic checks########
##D #test CENARMA(1,1)
##D SimModel <- function(OUTCENARMA){
##D   outSim <- boot.Cenarma(OUTCENARMA)
##D }
##D FitModel <- function(outSim){
##D   z <- outSim$y
##D   iz <- outSim$iy
##D   ans <- cenarma(z, iz, p=1, q=1)
##D   res <- resid(ans$outarima)
##D   list(res=res)
##D }
##D OUTCENARMA <- cenarma(y=NiagaraToxic$toxic, iy=c("o", "L")[1+NiagaraToxic$cQ], p=1, q=1)
##D func <- list(SimModel=SimModel, FitModel=FitModel)
##D start.time <- proc.time()[3]
##D outp <- portest(OUTCENARMA$outarima, lags=5:25, nslaves=8, NREP=10^3, func=func, test="LjungBox")
##D total.time <- proc.time()[3]-start.time
##D total.time
##D plot(outp[,1], outp[,4], xlab="lag", ylab="P-Value", cex=1.5, col="blue", pch=18, ylim=c(0,1))
##D abline(col="red", h=0.05)
##D #
##D #test CENAR(1)
##D SimModel <- function(OUTCENARMA){
##D   boot.Cenarma(OUTCENARMA)
##D }
##D FitModel <- function(outSim){
##D   z <- outSim$y
##D   iz <- outSim$iy
##D   ans <- cenarma(z, iz, p=1)
##D   res <- resid(ans$outarima)
##D   list(res=res)
##D }
##D OUTCENARMA <- cenarma(y=log(NiagaraToxic$toxic), iy=c("o", "L")[1+NiagaraToxic$cQ], p=1)
##D func <- list(SimModel=SimModel, FitModel=FitModel)
##D start.time <- proc.time()[3]
##D outp <- portest(OUTCENARMA$outarima, lags=5:25, nslaves=8, NREP=10^3, func=func, test="LjungBox")
##D total.time <- proc.time()[3]-start.time
##D total.time
##D plot(outp[,1], outp[,4], xlab="lag", ylab="P-Value", cex=1.5, col="blue", pch=18, ylim=c(0,1))
##D abline(col="red", h=0.05)
##D #
##D #bootstrap confidence intervals
##D #CENARMA(1,1)
##D OUTCENARMA <- cenarma(y=log(NiagaraToxic$toxic), iy=c("o", "L")[1+NiagaraToxic$cQ], p=1, q=1)
##D nboot <- 1000 
##D A <- matrix(numeric(nboot*3), ncol=3)
##D start.time <- proc.time()[3]
##D for (iboot in 1:nboot){
##D   out <- boot.Cenarma(OUTCENARMA)
##D   A[iboot, ] <- coef(cenarma(y=out$y, iy=out$iy, p=1, q=1)$outarima)
##D }
##D total.time <- proc.time()[3]-start.time
##D total.time
##D means <- apply(A, MARGIN=2, FUN=mean)
##D means
##D LO <- apply(A, MARGIN=2, function(x) quantile(x, 0.025))
##D HI <- apply(A, MARGIN=2, function(x) quantile(x, 0.975))
##D ansARMA11 <- matrix(c(LO,HI), nrow=3, dimnames=list(c("phi","theta","mu"), c("lo", "hi")))
##D #CEAR(1)
##D OUTCENARMA <- cenarma(y=log(NiagaraToxic$toxic), iy=c("o", "L")[1+NiagaraToxic$cQ], p=1)
##D nboot <- 1000 
##D A <- matrix(numeric(nboot*2), ncol=2)
##D start.time <- proc.time()[3]
##D for (iboot in 1:nboot){
##D   out <- boot.Cenarma(OUTCENARMA)
##D   A[iboot, ] <- coef(cenarma(y=out$y, iy=out$iy, p=1)$outarima)
##D }
##D total.time <- proc.time()[3]-start.time
##D total.time
##D means <- apply(A, MARGIN=2, FUN=mean)
##D means
##D LO <- apply(A, MARGIN=2, function(x) quantile(x, 0.025))
##D HI <- apply(A, MARGIN=2, function(x) quantile(x, 0.975))
##D ansAR2 <- matrix(c(LO,HI), nrow=2, dimnames=list(c("phi","mu"), c("lo", "hi")))
##D #summary
##D ansARMA11
##D ansAR2
## End(Not run)



