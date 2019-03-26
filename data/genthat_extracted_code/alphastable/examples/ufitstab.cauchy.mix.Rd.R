library(alphastable)


### Name: ufitstab.cauchy.mix
### Title: ufitstab.cauchy.mix
### Aliases: ufitstab.cauchy.mix

### ** Examples

# In the following, we give an example that fits a two-component mixture of Cauchy distributions
# to the survival times (in days) of 72 guinea pigs through the EM algorithm. For this, the initial
# values are: omega_0=(0.65,0.35), sigma_0=(20,50), beta_0=(0.20,0.05), and mu_0=(95,210).
library("stabledist")
y<-c(10,33,44,56,59,72,74,77,92,93,96,100,100,102,105,107,107,108,108,108,
     109,112,121,122,122,124,130,134,136,139,144,146,153,159,160,163,163,
     168,171,172,176,113,115,116,120,183,195,196,197,202,213,215,216,222,
     230,231,240,245,251,253,254,255,278,293,327,342,347,361,402,432,458,
     555)
## No test: 
ufitstab.cauchy.mix(y,2,c(0.65,0.35),c(0.20,0.05),c(20,50),c(95,210))
## End(No test)



