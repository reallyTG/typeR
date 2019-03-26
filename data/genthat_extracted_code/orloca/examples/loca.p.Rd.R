library(orloca)


### Name: loca.p
### Title: loca.p class for Operations Research LOCational Analysis
### Aliases: loca.p initialize print summary
### Keywords: classes optimize

### ** Examples

# A new unweighted loca.p object
loca <- loca.p(x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))
# or
loca <- new("loca.p", x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1))

# An example with weights and name
locb <- new("loca.p", x = c(-1, 1, 1, -1), y = c(-1, -1, 1, 1),
w = c(1, 2, 1, 2), label = "Weighted case")




