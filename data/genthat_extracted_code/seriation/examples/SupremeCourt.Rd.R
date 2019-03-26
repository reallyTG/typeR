library(seriation)


### Name: SupremeCourt
### Title: Voting Patterns in the Second Rehnquist U.S. Supreme Court
### Aliases: SupremeCourt
### Keywords: datasets

### ** Examples

data("SupremeCourt")

SupremeCourt

d <- as.dist(SupremeCourt)
o <- seriate(d)

pimage(d, o)

plot(hclust(as.dist(SupremeCourt)))



