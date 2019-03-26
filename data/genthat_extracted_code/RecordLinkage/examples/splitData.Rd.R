library(RecordLinkage)


### Name: splitData
### Title: Split Data
### Aliases: splitData
### Keywords: classif

### ** Examples

data(RLdata500)
pairs=compare.dedup(RLdata500, identity=identity.RLdata500, 
  blockfld=list(1,3,5,6,7))

# split into halves, do not enforce match ratio
l=splitData(pairs, prop=0.5)
summary(l$train)
summary(l$valid)

# split into 1/3 and 2/3, retain match ration
l=splitData(pairs, prop=1/3, keep.mprop=TRUE)
summary(l$train)
summary(l$valid)

# generate a training set with 100 non-matches and 10 matches
l=splitData(pairs, num.non=100, des.mprop=0.1, keep.mprop=TRUE)
summary(l$train)
summary(l$valid)




