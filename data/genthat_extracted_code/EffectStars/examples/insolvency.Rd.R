library(EffectStars)


### Name: insolvency
### Title: Insolvency data
### Aliases: insolvency
### Keywords: datasets ordinal response

### ** Examples

## Not run: 
##D data(insolvency)
##D 
##D 
##D star.sequential(Insolvency ~ Sector + Legal + Pecuniary_Reward + Seed_Capital
##D + Debt_Capital + Employees, insolvency, test.glob = FALSE, globcircle = TRUE, dist.x = 1.3)
##D 
##D star.cumulative(Insolvency ~ Sector + Employees, insolvency, select = 2:4)
## End(Not run)



