library(NMAoutlier)


### Name: Gupta2013
### Title: Network meta-analysis comparing interventions for actinic
###   keratosis
### Aliases: Gupta2013
### Keywords: datasets

### ** Examples

data(Gupta2013)
## No test: 
# Conduct forward search algorithm for the network of actinic
# keratosis
#
FSresult <- NMAoutlier(logOR, selogOR, t1, t2, id, data = Gupta2013)

# Draw forward plot for z-values from difference of direct and
# indirect evidence
#
fwdplot(FSresult, "nsplit")

# Draw forward plot for Q statistic
#
fwdplot(FSresult, "Q")
## End(No test)



