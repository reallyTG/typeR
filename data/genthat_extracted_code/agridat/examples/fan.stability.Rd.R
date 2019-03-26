library(agridat)


### Name: fan.stability
### Title: Multi-environment trial of maize hybrids in China
### Aliases: fan.stability
### Keywords: datasets

### ** Examples


data(fan.stability)
dat <- fan.stability

dat$env <- factor(paste(dat$loc, dat$year, sep=""))
require(lattice)
dotplot(gen~yield|env, dat, main="fan.stability")

if(require(reshape2) & require(agricolae)){
  dm <- acast(dat, gen~env, value.var='yield')
  # Use 0.464 as pooled error from ANOVA.  Calculate yield mean/stability.
  stability.par(dm, rep=3, MSerror=0.464) # Table 5 of Fan et al.
}




