library(copBasic)


### Name: tauCOP
### Title: The Kendall's Tau and Concordance Function of a Copula
### Aliases: tauCOP concordCOP
### Keywords: copula (characteristics) copula (properties) Nelsen (2006)
###   Examples and Exercises concordance function literature errors and
###   inconsistencies

### ** Examples

## Not run: 
##D tauCOP(cop=PSP) # 1/3
##D # Now compute Kendall Tau via integration of the Kendall Function.
##D # 3 - 4*integrate(function(t) kfuncCOP(t, cop=PSP), 0, 1)$value # 0.3333314
## End(Not run)

## Not run: 
##D tauCOP(cop=PSP, brute=TRUE) # 0.3306625
##D # CPU heavy example showing that the dual-integration (fast) results in
##D # a Kendall's Tau that matches a sample version
##D dotau <- function(n) {
##D    uv <- simCOP(n=n, cop=PSP, ploton=FALSE, points=FALSE)
##D    return(cor(uv$U, uv$V, method="kendall"))
##D }
##D set.seed(817600)
##D taus <- replicate(100, dotau(100))
##D tau.sample <- mean(taus); print(tau.sample) # 0.3342034
## End(Not run)

## Not run: 
##D # Nelsen (2006, pp. 160-161, numeric results shown thereine)
##D # The rational values or integers may be derived analytically.
##D tauCOP(cop=M, cop2=M) #   1, correct
##D tauCOP(cop=M, cop2=P) # 1/3, correct
##D tauCOP(cop=P, cop2=M) # 1/3, correct
##D tauCOP(cop=M, cop2=W) #   0, correct
##D tauCOP(cop=W, cop2=M) # throws warning, swaps copulas, == tauCOP(M,W)
##D tauCOP(cop=W, cop2=P) # throws warning, swaps copulas, approx. -1/3
##D tauCOP(cop=P, cop2=W) # -1/3, correct
##D tauCOP(cop=P, cop2=P) #    0, correct
##D tauCOP(cop=M, cop2=W, brute=TRUE) #    0, correct
## End(Not run)

## Not run: 
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop,
##D              para1=0.00395, para2=4.67, alpha=0.9392, beta=0.5699)
##D tauCOP(cop=composite2COP, para=para) # -0.4671213
##D 
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop,
##D              para1=0.14147, para2=20.96, alpha=0.0411, beta=0.6873)
##D tauCOP(cop=composite2COP, para=para) # +0.1950727
##D 
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop,
##D              para1=0.10137, para2=4492.87, alpha=0.0063, beta=0.0167)
##D # Theoretical attempt fails because para2 is large and thus a singularity
##D # is emerging and internal copula swapping does not help.
##D tauCOP(cop=composite2COP, para=para) # fails (0.94+-.01)
##D tauCOP(cop=composite2COP, para=para, brute=TRUE) # about 0.94+-.01
## End(Not run)



