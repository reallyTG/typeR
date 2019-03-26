library(dad)


### Name: print.fdiscd.misclass
### Title: Printing results of discriminant analysis of probability density
###   functions
### Aliases: print.fdiscd.misclass

### ** Examples

data(castles.dated)
castlesfh <- folderh(castles.dated$periods, "castle", castles.dated$stones)
result <- fdiscd.misclass(castlesfh, "period")
print(result)
print(result, dist.print=TRUE)
print(result, prox.print=TRUE)



