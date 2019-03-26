library(GENEAclassify)


### Name: inGroup
### Title: Which values are in a new group?
### Aliases: inGroup
### Keywords: internal

### ** Examples

GENEAclassify:::inGroup(x = rep(-1, 5))
x1 <- c(1, 1, 1, 2, 2, 2, 2, 3, 3)
x1t <- GENEAclassify:::inGroup(x = x1)
x1[x1t]



