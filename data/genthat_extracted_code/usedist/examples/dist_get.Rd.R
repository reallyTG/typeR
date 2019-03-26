library(usedist)


### Name: dist_get
### Title: Retrieve distances from a '"dist"' object. Check if square Check
###   if numeric
### Aliases: dist_get

### ** Examples

m4 <- matrix(1:16, nrow=4, dimnames=list(LETTERS[1:4]))
dm4 <- dist(m4)
dist_get(dm4, "A", "C")
dist_get(dm4, "A", c("A", "B", "C", "D"))
dist_get(dm4, c("A", "B", "C"), c("B", "D", "B"))



