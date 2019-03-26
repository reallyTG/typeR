library(dad)


### Name: print.fdiscd.predict
### Title: Printing results of discriminant analysis of probability density
###   functions
### Aliases: print.fdiscd.predict

### ** Examples

data(castles.dated)
data(castles.nondated)
castles.stones <- rbind(castles.dated$stones, castles.nondated$stones)
castles.periods <- rbind(castles.dated$periods, castles.nondated$periods)
castlesfh <- folderh(castles.periods, "castle", castles.stones)
result <- fdiscd.predict(castlesfh, "period")
print(result)
print(result, prox.print=TRUE)



