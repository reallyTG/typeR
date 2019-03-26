library(miceadds)


### Name: jomo2datlist
### Title: Converts a 'jomo' Data Frame in Long Format into a List of
###   Datasets or an Object of Class 'mids'
### Aliases: jomo2datlist jomo2mids

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset nhanes | jomo imputation and conversion into a data list
#############################################################################

data( nhanes, package="mice")
dat <- nhanes

# impute under multivariate normal model in jomo
imp1 <- jomo::jomo1con(Y=dat, nburn=100, nbetween=10, nimp=5)
# convert into a list of datasets
datlist1 <- miceadds::jomo2datlist(imp1)
# convert into mids object
datlist2 <- miceadds::jomo2datlist(imp1)



