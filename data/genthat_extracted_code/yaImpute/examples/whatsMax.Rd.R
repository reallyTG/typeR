library(yaImpute)


### Name: whatsMax
### Title: Find maximum column for each row
### Aliases: whatsMax
### Keywords: misc

### ** Examples

data(MoscowMtStJoe)

# get the basal area by species columns
yba  <- MoscowMtStJoe[,1:17]

# for each row, pick the species that has the max basal area
# create "other" for those not in the top 7.

ybaB <- whatsMax(yba,nbig=7)
levels(ybaB[,1])



