library(predkmeans)


### Name: createCVgroups
### Title: Creating k-fold Cross-Validation Groups
### Aliases: createCVgroups

### ** Examples

# 5-fold groups
cv5 <- createCVgroups(n=100, k=5)
cv5

# Leave-one-out
cvLOO <- createCVgroups(n=100, k=0)
cvLOO



