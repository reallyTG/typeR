library(osDesign)


### Name: tps
### Title: Estimation for two-phase designs.
### Aliases: tps

### ** Examples

##
data(Ohio)

## Phase I stratification based on age
##
Ohio$S <- Ohio$Age + 1
K <- length(unique(Ohio$S))

## Phase I data
##
Ohio$nonDeath <- Ohio$N-Ohio$Death
nn0 <- aggregate(Ohio$nonDeath, list(S=Ohio$S), FUN=sum)$x
nn1 <- aggregate(Ohio$Death, list(S=Ohio$S), FUN=sum)$x

## Phase II sample sizes
##
nPhIIconts <- rep(100, 3)
nPhIIcases <- rep(100, 3)

## 'Generate' phase II data
##
Ohio$conts <- NA
Ohio$cases <- NA
for(k in 1:K)
{
  Ohio$conts[Ohio$S == k] <- rmvhyper(Ohio$nonDeath[Ohio$S == k],
                                      nPhIIconts[k])
  Ohio$cases[Ohio$S == k] <- rmvhyper(Ohio$Death[Ohio$S == k],
                                      nPhIIcases[k])
}

## Three estimators
##
tps(cbind(cases, conts) ~ factor(Age) + Sex + Race, data=Ohio, nn0=nn0,
    nn1=nn1, group=Ohio$S, method="WL")
tps(cbind(cases, conts) ~ factor(Age) + Sex + Race, data=Ohio, nn0=nn0,
    nn1=nn1, group=Ohio$S, method="PL")
tps(cbind(cases, conts) ~ factor(Age) + Sex + Race, data=Ohio, nn0=nn0,
    nn1=nn1, group=Ohio$S, method="ML")

## An example where (most of the time) the constraints are not satisfied and a warning is returned
##
tps(cbind(cases, conts) ~ Sex + Race, data=Ohio, nn0=nn0,
    nn1=nn1, group=Ohio$S, method="ML")



