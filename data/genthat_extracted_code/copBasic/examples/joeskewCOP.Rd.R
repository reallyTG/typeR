library(copBasic)


### Name: joeskewCOP
### Title: Joe's Nu-Skew and the copBasic Nu-Star of a Copula
### Aliases: joeskewCOP nuskewCOP nustarCOP
### Keywords: copula (characteristics) copula (properties) permutation
###   asymmetry radial asymmetry Moments of combined U and V bivariate
###   skewness Joe (2014) Examples and Exercises Nu-Skew and Nu-Star
###   (skewnesses)

### ** Examples

nuskewCOP(cop=GHcop,para=c(1.43,1/2,1))*(6/96) # 0.005886 (Joe, 2014, p. 184; 0.0059)

## Not run: 
##D joeskewCOP(            cop=GHcop, para=c(8, .7, .5)) # -0.1523491
##D joeskewCOP(            cop=GHcop, para=c(8, .5, .7)) # +0.1523472
##D # UV <- simCOP(n=1000, cop=GHcop, para=c(8, .7, .5)) # see the switch in
##D # UV <- simCOP(n=1000, cop=GHcop, para=c(8, .5, .7)) # curvature
## End(Not run)

## Not run: 
##D para=c(19,0.3,0.8); set.seed(341)
##D nuskew <-  nuskewCOP( cop=GHcop, para=para) # 0.3057744
##D UV <- simCOP(n=10000, cop=GHcop, para=para) #   a large simulation
##D mean((UV$U - UV$V)^3)/(6/96)                # 0.3127398
##D 
##D # Two other definitions of skewness follow and are not numerically the same.
##D uvskew(u=UV$U, v=UV$V, umv=TRUE)  # 0.3738987  (see documentation uvskew)
##D uvskew(u=UV$U, v=UV$V, umv=FALSE) # 0.3592739  ( or documentation uvlmoms)
##D # Yet another definition of skew, which requires large sample approximation
##D # using the L-comoments (3rd L-comoment is L-coskew).
##D lmomco::lcomoms2(UV)$T3 # L-coskew of the simulated values [1,2] and [2,1]
##D #             [,1]        [,2]
##D #[1,]  0.007398438  0.17076600
##D #[2,] -0.061060260 -0.00006613
##D # See the asymmetry in the two L-coskew values and consider this in light of
##D # the graphic produced by the simCOP() called for n=10,000. The T3[1,1] is
##D # the sampled L-skew (univariate) of the U margin and T3[2,2] is the same
##D # but for the V margin. Because the margins are uniform (ideally) then these
##D # for suitable large sample must be zero because the L-skew of the uniform
##D # distribution is by definition zero.
##D #
##D # Now let us check the sample estimator for sample of size n=300, and the
##D # t-test will (should) result in acceptance of the NULL hypothesis.
##D S <- replicate(60, nuskewCOP(para=simCOP(n=300, cop=GHcop, para=para,
##D                                          graphics=FALSE), as.sample=TRUE))
##D t.test(S, mu=nuskew)
##D #t = 0.004633, df = 59, p-value = 0.9963
##D #alternative hypothesis: true mean is not equal to 0.3057744
##D #95 percent confidence interval:
##D # 0.2854282 0.3262150
##D #sample estimates:
##D #mean of x
##D #0.3058216 
## End(Not run)

## Not run: 
##D # Let us run a large ensemble of copula properties that use the whole copula
##D # (not tail properties). We composite a Plackett with a Gumbel-Hougaard for
##D # which the over all association (correlation) sign is negative, but amongst
##D # these statistics with nuskew and nustar at the bottom, there are various
##D # quantities that can be extracted. These could be used for fitting.
##D set.seed(873)
##D para <- list(cop1=PLcop, cop2=GHcop, alpha=0.6, beta=0.9,
##D              para1=.005, para2=c(8.3,0.25,0.7))
##D UV <- simCOP(1000, cop=composite2COP, para=para) # just to show
##D   blomCOP(composite2COP, para)            # -0.4078657
##D   footCOP(composite2COP, para)            # -0.2854227
##D   hoefCOP(composite2COP, para)            # +0.5713775
##D   lcomCOP(composite2COP, para)$lcomUV[3]  # +0.1816084
##D   lcomCOP(composite2COP, para)$lcomVU[3]  # +0.1279844
##D    rhoCOP(composite2COP, para)            # -0.5688417
##D rhobevCOP(composite2COP, para)            # -0.2005210
##D    tauCOP(composite2COP, para)            # -0.4514693
##D   wolfCOP(composite2COP, para)            # +0.5691933
##D nustarCOP(composite2COP, para)            # -0.5172434
##D nuskewCOP(composite2COP, para)            # +0.0714987 
## End(Not run)



