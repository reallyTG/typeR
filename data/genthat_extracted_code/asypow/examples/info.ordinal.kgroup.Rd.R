library(asypow)


### Name: info.ordinal.kgroup
### Title: Expected Information Matrix for Single or Multiple Group Ordinal
###   Observations
### Aliases: info.ordinal.kgroup
### Keywords: htest

### ** Examples

# Find the information matrix for a 2 group ordinal
# model with 4 categories.
p1 <- c(.1, .2, .3)  # Probabilities for group 1
p2 <- c(.2, .5, .7)  # Probabilities for group 2
p <- rbind(p1,p2)
ngrps <- c(.4, .6)  # Percentage of data in each group
info.ord <- info.ordinal.kgroup(p, ngrps)
print(info.ord)



