library(copBasic)


### Name: giniCOP
### Title: The Gini Gamma of a Copula
### Aliases: giniCOP
### Keywords: copula (characteristics) copula (properties)

### ** Examples

giniCOP(cop=PSP)                                 #                 = 0.3819757
## Not run: 
##D giniCOP( cop=PSP, by.concordance=TRUE)           # Q(C,M) + Q(C,W) = 0.3820045
##D # use convex combination ---triggers integration warning but returns anyway
##D cxpara <- list(alpha=1/2, cop1=M, cop2=W) # parameters for convex2COP()
##D 2*tauCOP(cop=PSP, cop2=convex2COP, para2=cxpara) #    2*Q(C,A)     = 0.3819807
##D # where the later issued warnings on the integration
## End(Not run)

## Not run: 
##D n <- 2000; UV <- simCOP(n=n, cop=N4212cop, para=9.3, graphics=FALSE)
##D giniCOP(para=UV, as.sample=TRUE)                     # 0.9475900 (sample version)
##D giniCOP(cop=N4212cop, para=9.3)                      # 0.9479528 (copula integration)
##D giniCOP(cop=N4212cop, para=9.3, by.concordance=TRUE) # 0.9480267 (concordance function)
##D # where the later issued warnings on the integration
## End(Not run)

## Not run: 
##D # The canoncial example of theoretical and sample estimators of bivariate
##D # association for the package: Blomqvist Beta, Spearman Footrule, Gini Gamma,
##D # Hoeffding Phi, Kendall Tau, Spearman Rho, and Schweizer-Wolff Sigma
##D # and comparison to L-correlation via lmomco::lcomoms2().
##D n <- 9000; set.seed(56)
##D para <- list(cop1=PLACKETTcop, cop2=PLACKETTcop, para1=1.45, para2=21.9,
##D              alpha=0.41, beta=0.08)
##D D <- simCOP(n=n, cop=composite2COP, para=para, cex=0.5, col=rgb(0,0,0,0.2), pch=16)
##D blomCOP(cop=composite2COP, para=para)         # 0.4037908 (theoretical)
##D blomCOP(para=D, as.sample=TRUE)               # 0.4008889 (sample)
##D footCOP(cop=composite2COP, para=para)         # 0.3721555 (theoretical)
##D footCOP(para=D, as.sample=TRUE)               # 0.3703623 (sample)
##D giniCOP(cop=composite2COP, para=para)         # 0.4334687 (theoretical)
##D giniCOP(para=D, as.sample=TRUE)               # 0.4311698 (sample)
##D tauCOP(cop=composite2COP, para=para)          # 0.3806909 (theoretical)
##D tauCOP(para=D,  as.sample=TRUE)               # 0.3788139 (sample)
##D rhoCOP(cop=composite2COP, para=para)          # 0.5257662 (theoretical)
##D rhoCOP(para=D,  as.sample=TRUE)               # 0.5242380 (sample)
##D lmomco::lcomoms2(D)$T2      # 1               # 0.5242388 (sample matrix)
##D                             # 0.5245154 1
##D hoefCOP(cop=composite2COP, para=para)         # 0.5082776 (theoretical)
##D subsample <- D[sample(1:n, n/5),] # subsampling for speed
##D hoefCOP(para=subsample, as.sample=TRUE)       # 0.5033842 (re-sample)
##D #hoefCOP(para=D, as.sample=TRUE) # major CPU hog, n too big
##D # because the Ds are already "probabilities" just resample as shown above
##D wolfCOP(cop=composite2COP, para=para)         # 0.5257662 (theoretical)
##D #wolfCOP(para=D, as.sample=TRUE) # major CPU hog, n too big
##D wolfCOP(para=subsample, as.sample=TRUE)       # 0.5338009 (re-sample)
## End(Not run)



