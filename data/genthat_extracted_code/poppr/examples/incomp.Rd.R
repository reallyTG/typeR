library(poppr)


### Name: incomp
### Title: Check for samples that are incomparable due to missing data
### Aliases: incomp

### ** Examples


data(nancycats)
# These two populations have no samples that are incomparable
incomp(nancycats[pop = c(1, 17)])

# If you reduce the number of loci, we find that there are 
# incomparable samples.
incomp(nancycats[pop = c(1, 17), loc = c(1, 4)])



