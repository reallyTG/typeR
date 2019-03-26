library(zCompositions)


### Name: multKM
### Title: Multiplicative Kaplan-Meier smoothing spline (KMSS) replacement
### Aliases: multKM
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(Water)
data(mdl) # matrix of limits of detection for Water

Water_multKM <- multKM(Water,label=0,dl=mdl)

# Different smoothing degree by component
Water_multKM2 <- multKM(Water,label=0,dl=mdl,n.knots=c(25,50,30,75))

# Easy to use for KM multiple imputation (m = 10)
Water.mi <- vector("list",length=10)
for (m in 1:10){
  Water.mi[[m]] <- multKM(Water,label=0,dl=mdl,n.draws=1)
}




