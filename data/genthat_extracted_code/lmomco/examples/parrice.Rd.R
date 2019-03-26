library(lmomco)


### Name: parrice
### Title: Estimate the Parameters of the Rice Distribution
### Aliases: parrice
### Keywords: distribution (parameters) Distribution: Rice

### ** Examples

## Not run: 
##D  
##D   parrice(lmomrice(vec2par(c(10,50),   type="rice"))) # Within Rician limits
##D   parrice(lmomrice(vec2par(c(100,0.1), type="rice"))) # Beyond Rician limits
##D 
##D plotlmrdia(lmrdia(), xlim=c(0,0.2), ylim=c(-0.1,0.22),
##D            autolegend=TRUE, xleg=0.05, yleg=0.05)
##D lines(.lmomcohash$RiceTable$TAU3, .lmomcohash$RiceTable$TAU4, lwd=5, col=8)
##D legend(0.1,0, "RICE DISTRIBUTION", lwd=5, col=8, bty="n")
##D text(0.14,-0.04, "Normal distribution limit on left end point")
##D text(0.14,-0.055, "Rayleigh distribution limit on right end point")
##D 
##D # check parrice against a Maximum Likelihood method in VGAM
##D set.seed(1)
##D library(VGAM) # now example from riceff() of VGAM
##D vee <- exp(2); sigma <- exp(1); y <- rrice(n <- 1000, vee, sigma)
##D fit <- vglm(y ~ 1, riceff, trace=TRUE, crit="c")
##D Coef(fit)
##D # NOW THE MOMENT OF TRUTH, USING L-MOMENTS
##D parrice(lmoms(y))
##D # VGAM package 0.8-1 reports
##D #     vee    sigma
##D # 7.344560 2.805877
##D # lmomco 1.2.2 reports
##D #      nu    alpha
##D # 7.348784 2.797651
## End(Not run)



