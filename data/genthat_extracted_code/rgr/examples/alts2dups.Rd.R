library(rgr)


### Name: alts2dups
### Title: Create a Matrix of Duplicate Pairs from Sequential Data
### Aliases: alts2dups
### Keywords: misc manip

### ** Examples

## Make test data available
data(ad.test)
attach(ad.test)

## Save matrix of duplicate pairs
test.save <- alts2dups(Cu, ifalt = TRUE)

## Plot analytical duplicate analyses
plot(alts2dups(Cu, ifalt = TRUE), log = "xy")

## Clean-up and detach test data
rm(test.save)
detach(ad.test)



