library(mbbefd)


### Name: beaonre
### Title: AON Re Belgian dataset
### Aliases: beaonre
### Keywords: datasets

### ** Examples


# (1) load of data
#
data(beaonre)

# (2) plot and description of data
#

boxplot(ClaimCost ~ BuildType, data=beaonre, log="y", 
xlab="Building type", ylab="Claim size", main="AON Re Belgium data")






