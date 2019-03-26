library(doBy)


### Name: by-subset
### Title: Finds subsets of a dataframe which is split by variables in a
###   formula.
### Aliases: by-subset subsetBy
### Keywords: utilities

### ** Examples


data(dietox)
subsetBy(~Evit, Weight < mean(Weight), data=dietox)




