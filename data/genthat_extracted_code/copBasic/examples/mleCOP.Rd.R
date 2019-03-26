library(copBasic)


### Name: mleCOP
### Title: Maximum Pseudo-Log-Likelihood Estimation for Copula Parameter
###   Estimation
### Aliases: mleCOP
### Keywords: copula (fitting) maximum likelihood API to the copula package
###   package copula (comparison to)

### ** Examples

## Not run: 
##D set.seed(162); UV <- simCOP(n=188, cop=PLACKETTcop, para=5.6)
##D ML <- mleCOP(UV$U, UV$V, cop=PLACKETTcop, interval=c(0.1,40)) # 5.225459 estimated
##D 
##D Thetas <- 10^(seq(log10(0.001),log10(100), by=.005))
##D MLs <- sapply(Thetas, function(k)
##D               densityCOP(UV$U, UV$V, cop=PLACKETTcop, para=k, sumlogs=TRUE))
##D plot(Thetas, MLs, log="x", type="l", # draw the pMLE solution process
##D      xlab="Plackett Theta", ylab="sum of log densities")
##D lines(rep(ML$para, 2), c(ML$objective, par()$usr[3]), col=2) # 
## End(Not run)

## Not run: 
##D set.seed(149); UV <- simCOP(1000, cop=CLcop, para=pi)
##D # Warning messages about using optim() for 1D solution
##D mleCOP(UV, cop=CLcop, init.para=2)$para          # 3.082031
##D # No warning message, optimise() called instead.
##D mleCOP(UV, cop=CLcop, interval=c(0,1E2))$para    # 3.081699 
## End(Not run)

# See extended code listings and discussion in the Note section



