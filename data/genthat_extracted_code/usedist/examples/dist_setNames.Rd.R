library(usedist)


### Name: dist_setNames
### Title: Set the names/labels of a '"dist"' object.
### Aliases: dist_setNames

### ** Examples

m4 <- matrix(1:16, nrow=4, dimnames=list(LETTERS[1:4]))
dm4 <- dist(m4)
dist_setNames(dm4, LETTERS[9:12])



