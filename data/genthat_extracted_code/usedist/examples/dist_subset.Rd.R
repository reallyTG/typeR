library(usedist)


### Name: dist_subset
### Title: Extract parts of a '"dist"' object.
### Aliases: dist_subset

### ** Examples

m4 <- matrix(1:16, nrow=4, dimnames=list(LETTERS[1:4]))
dm4 <- dist(m4)
dist_subset(dm4, c("A", "B", "C"))
dist_subset(dm4, c("D", "C", "B", "A"))



