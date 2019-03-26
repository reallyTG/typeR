library(dad)


### Name: fdiscd.misclass
### Title: Misclassification ratio in functional discriminant analysis of
###   probability densities.
### Aliases: fdiscd.misclass

### ** Examples

data(castles.dated)
castles.stones <- castles.dated$stones
castles.periods <- castles.dated$periods
castlesfh <- folderh(castles.periods, "castle", castles.stones)
result <- fdiscd.misclass(castlesfh, "period")
print(result)



