library(DoE.base)


### Name: fac.design
### Title: Function for full factorial designs
### Aliases: fac.design
### Keywords: array design

### ** Examples

  ## only specify level combination 
  fac.design(nlevels=c(4,3,3,2))
  ## design requested via factor.names
  fac.design(factor.names=list(one=c("a","b","c"), two=c(125,275), 
     three=c("old","new"), four=c(-1,1), five=c("min","medium","max")))
  ## design requested via character factor.names and nlevels 
  ##    (with a little German lesson for one two three)
  fac.design(factor.names=c("eins","zwei","drei"),nlevels=c(2,3,2))
  
  ### blocking designs
  fac.design(nlevels=c(2,2,3,3,6), blocks=6, seed=12345)
  ## the same design, now unnecessarily constructed via option block.gen
  ## preparation: look at the numbers of levels of pseudo factors
  ## (in this order)
  unlist(factorize(c(2,2,3,3,6)))
  ## or, for more annotation, factorize the unblocked design
  factorize(fac.design(nlevels=c(2,2,3,3,6)))
  ## positions 1 2 5 are 2-level pseudo factors
  ## positions 3 4 6 are 4-level pseudo factors
  ## blocking with highest possible interactions
  G <- rbind(two=c(1,1,0,0,1,0),three=c(0,0,1,1,0,1))
  plan.6blocks <- fac.design(nlevels=c(2,2,3,3,6), blocks=6, block.gen=G, seed=12345)
  plan.6blocks
  
  ## two blocks, default design, but unnecessarily constructed via block.gen
  fac.design(nlevels=c(2,2,3,3,6), blocks=2, block.gen=c(1,1,0,0,1,0), seed=12345)
  
  ## three blocks, default design, but unnecessarily constructed via block.gen
  fac.design(nlevels=c(2,2,3,3,6), blocks=3, block.gen=c(0,0,1,1,0,1), seed=12345)
  
  ## nine blocks
  ## confounding two-factor interactions cannot be avoided
  ## there are warnings to that effect
  G <- rbind(CD=c(0,0,1,1,0,0),CE2=c(0,0,1,0,0,1))
  plan.9blocks <- fac.design(nlevels=c(2,2,3,3,6), blocks=9, block.gen=G, seed=12345)

  ## further automatic designs, not run for shortening run time 
  ## Not run: 
##D   fac.design(nlevels=c(2,2,3,3,6), blocks=4, seed=12345)
##D   fac.design(nlevels=c(2,2,3,3,6), blocks=9, seed=12345)
##D   fac.design(nlevels=c(2,2,3,3,6), blocks=36, seed=12345)
##D   fac.design(nlevels=c(3,5,6,10), blocks=15, seed=12345)
##D   
## End(Not run)
   
  ## independently check aliasing
  ## model with block main effects and all two-factor interactions
  ## 6 factors: not aliased
  summary(plan.6blocks)
  alias(lm(1:nrow(plan.6blocks)~Blocks+(A+B+C+D+E)^2,plan.6blocks))
  ## 9 factors: aliased
  summary(plan.9blocks)
  alias(lm(1:nrow(plan.9blocks)~Blocks+(A+B+C+D+E)^2,plan.9blocks))



