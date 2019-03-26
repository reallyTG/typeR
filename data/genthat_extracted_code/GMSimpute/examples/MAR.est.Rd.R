library(GMSimpute)


### Name: MAR.est
### Title: Missing At Random (MAR) proportion estimation based on technical
###   replicates.
### Aliases: MAR.est

### ** Examples

data('replicates')
# replicates contains mass specturm log abundance of 85 peptides
# with missing values for 4 pairs of technical replicates.


MAR=MAR.est(replicates,sample=rep(1:4,each=2),log.scale=FALSE,violin.plot=TRUE)
# Estimates the MAR proportion in the 4 pairs of replicates and output violin/box plots object.

print(MAR$plot)
# Print violin/box plots




