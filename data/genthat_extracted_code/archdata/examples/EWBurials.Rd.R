library(archdata)


### Name: EWBurials
### Title: Ernest Witte Cemetery, Austin, County, Texas, U.S.A.
### Aliases: EWBurials
### Keywords: datasets

### ** Examples

data(EWBurials)
xtabs(~Age+Sex+Group, EWBurials)

library(circular)
plot(EWBurials$Direction)



