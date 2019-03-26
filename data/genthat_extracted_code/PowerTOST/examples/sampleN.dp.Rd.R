library(PowerTOST)


### Name: sampleN.dp
### Title: Sample size estimation of dose-proportionality studies evaluated
###   via Power model
### Aliases: sampleN.dp

### ** Examples

# using all the defaults, i.e. crossover design, alpha=0.05
# theta1=0.8, theta2=1.25 but true slope slightly off 1
sampleN.dp(CV=0.2, doses=c(1, 2, 8), beta0=1.02)
# should give n=18, power=0.854528

## Not run: 
##D # incomplete block design mentioned in Sethuraman et al.
##D # with 5 doses, 20 sequences, 3 periods
##D # (I hope at least that the design is that they used)
##D library(crossdes)
##D # IBD based on mutually orthogonal Latin squares
##D ibd <- des.MOLS(trt=5, k=3)
##D CVb <- mse2CV(0.8) # Sethuraman et al. omega squared
##D sampleN.dp(CV=0.2, doses=c(5, 25, 50, 100, 200), beta0=1, design="IBD", dm=ibd, CVb=CVb)
##D # power of that design near 90% with n=30, sequence group unbalanced 
##D power.dp(CV=0.2, doses=c(5, 25, 50, 100, 200), n=30, beta0=1, design="IBD", dm=ibd, CVb=CVb)
## End(Not run)



