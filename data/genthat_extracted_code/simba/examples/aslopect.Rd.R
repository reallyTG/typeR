library(simba)


### Name: aslopect
### Title: Calculate similarity of plots based on slope aspect and
###   inclination
### Aliases: aslopect
### Keywords: methods univar

### ** Examples

data(abis)
## identify columns with slope and aspect data
names(abis.env)

## calculate aslopect
abis.aslop <- aslopect(abis.env[,4], abis.env[,5])




