library(ph2bye)


### Name: MultPostP.design
### Title: The stopping boundaries based on the multiple outcomes criterion
### Aliases: MultPostP.design

### ** Examples

## Using vague prior Unif(0,1)
MultPostP.design(type="futility",nmax = 30,a.vec = c(1,1,1,1),p0 = 0.15, theta = 0.05)
MultPostP.design(type="efficacy",nmax = 30,a.vec = c(1,1,1,1),p0 = 0.15, theta = 0.9)
MultPostP.design(type="toxicity",nmax = 30,a.vec = c(1,1,1,1),p0 = 0.15, theta = 0.95)



