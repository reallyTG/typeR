library(copBasic)


### Name: convex2COP
### Title: Convex Combination of Two Copulas
### Aliases: convex2COP
### Keywords: copula composition copula composition (convex combination)

### ** Examples

para <- list(alpha=0.24, cop1=FRECHETcop, para1=c(.4,.56),
                         cop2=PSP,        para2=NA)
convex2COP(0.87,0.35, para=para) # 0.3188711
## Not run: 
##D # Suppose we have a target Kendall Tau of 1/3 and a Gumbel-Hougaard copula seems
##D # attractive but the GH has just too much upper tail dependency for comfort. We
##D # think from data analysis that an upper tail dependency that is weaker and near
##D # 2/10 is the better. Let us convex mix in a Plackett copula and optimize.
##D TargetTau <- tauCOP(cop=GHcop, para=1.5) # 1/3 (Kendall's Tau)
##D taildepCOP(   cop=GHcop, para=1.5, plot = TRUE)$lambdaU  # 0.4126
##D TargetUpperTailDep <- 2/10
##D 
##D # **Serious CPU time pending for this example**
##D par <- c(-.10, 4.65) # Initial guess but the first parameter is in standard
##D # normal for optim() to keep us in the [0,1] domain when converted to probability.
##D # The guesses of -0.10 (standard deviation) for the convex parameter and 4.65 for
##D # the Plackett are based on a much longer search times as setup for this problem.
##D # The simplex for optim() is going to be close to the solution on startup.
##D "afunc" <- function(par) {
##D    para <- list(alpha=pnorm(par[1]), cop1=GHcop,       para1=1.5,
##D                                      cop2=PLACKETTcop, para2=par[2])
##D    tau  <- tauCOP(cop=convex2COP, para=para)
##D    taildep <- taildepCOP(cop=convex2COP, para=para, plot = FALSE)$lambdaU
##D    err <- sqrt((TargetTau - tau)^2 + (TargetUpperTailDep - taildep)^2)
##D    print(c(pnorm(par[1]), par[2], tau, taildep, err))
##D    return(err)
##D }
##D mysolution <- optim(par, afunc, control=list(abstol=1E-4))
##D 
##D para <- list(alpha=.4846902, cop1=GHcop,       para1=1.5,
##D                              cop2=PLACKETTcop, para2=4.711464)
##D UV <- simCOP(n=2500, cop=convex2COP, para=para, snv=TRUE) # 
## End(Not run)



