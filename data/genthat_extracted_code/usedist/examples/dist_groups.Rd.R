library(usedist)


### Name: dist_groups
### Title: Create a data frame of distances between groups of items.
### Aliases: dist_groups

### ** Examples

m4 <- matrix(1:16, nrow=4, dimnames=list(LETTERS[1:4]))
dm4 <- dist(m4)
g4 <- rep(c("Control", "Treatment"), each=2)
dist_groups(dm4, g4)



