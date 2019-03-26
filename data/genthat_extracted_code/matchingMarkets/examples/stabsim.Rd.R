library(matchingMarkets)


### Name: stabsim
### Title: Simulated data for group formation problem
### Aliases: stabsim
### Keywords: generate

### ** Examples

## Coalitions [gpm := 2 !]
## Simulate one-sided matching data for 4 markets (m=4) with 2 groups
## per market (gpm=2) and 2 to 4 individuals per group (ind=2:4)
 idata <- stabsim(m=4, ind=2:4, seed=124, singles=2, gpm=2)  

## Rommmates [ind := 2 !]
## Simulate one-sided matching data for 3 markets (m=3) with 3 groups
## per market (gpm=3) and 2 individuals per group (ind=2)
 idata <- stabsim(m=3, ind=2, seed=124, gpm=3)



