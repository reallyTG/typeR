library(copBasic)


### Name: PLACKETTpar
### Title: Estimate the Parameter of the Plackett Copula
### Aliases: PLACKETTpar PLpar
### Keywords: Plackett copula copula (estimation)

### ** Examples

Q1 <- rnorm(1000); Q2 <- Q1+rnorm(1000)
PLpar(Q1,Q2); PLpar(Q1,Q2, byrho=TRUE) # two estimates for same data
PLpar(rho= 0.76) # positive association
PLpar(rho=-0.76) # negative association
tauCOP(cop=PLcop, para=PLpar(rho=-0.15, by.rho=TRUE))

## Not run: 
##D RHOS <- seq(0,0.990, by=0.002); TAUS <- rep(NA, length(RHOS))
##D for(i in 1:length(RHOS)) {
##D    #message("Spearman's Rho: ", RHOS[i])
##D    theta <- PLACKETTpar(rho=RHOS[i], by.rho=TRUE); tau <- NA
##D    try(tau <- tauCOP(cop=PLACKETTcop, para=theta), silent=TRUE)
##D    TAUS[i] <- ifelse(is.null(tau), NA, tau)
##D }
##D LM <- lm(TAUS~  RHOS    + I(RHOS^2) + I(RHOS^3) + I(RHOS^4) +
##D               I(RHOS^5) + I(RHOS^6) + I(RHOS^7) + I(RHOS^8) - 1)
##D plot(RHOS,TAUS, type="l", xlab="abs(Spearman Rho)", ylab="abs(Kendall Tau)")
##D lines(RHOS,fitted.values(LM), col=3)#
## End(Not run)



