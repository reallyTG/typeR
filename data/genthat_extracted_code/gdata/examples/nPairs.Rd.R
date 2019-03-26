library(gdata)


### Name: nPairs
### Title: Number of variable pairs
### Aliases: nPairs
### Keywords: misc

### ** Examples


## Test data
test <- data.frame(V1=c(1, 2, 3, 4, 5),
                   V2=c(NA, 2, 3, 4, 5),
                   V3=c(1, NA, NA, NA, NA),
                   V4=c(1, 2, 3, NA, NA))

## Number of variable pairs
nPairs(x=test)

## Without names
nPairs(x=test, names=FALSE)

## Longer names
colnames(test) <- c("Variable1", "Variable2", "Variable3", "Variable4")
nPairs(x=test)

## Margin
nPairs(x=test, margin=TRUE)

## Summary
summary(object=nPairs(x=test))



