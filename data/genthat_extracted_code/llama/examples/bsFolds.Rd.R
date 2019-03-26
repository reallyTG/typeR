library(llama)


### Name: bsFolds
### Title: Bootstrapping folds
### Aliases: bsFolds
### Keywords: models

### ** Examples

data(satsolvers)
folds = bsFolds(satsolvers)

# use 5 folds instead of the default 10
folds5 = bsFolds(satsolvers, 5L)

# stratify
foldsU = bsFolds(satsolvers, stratify=TRUE)



