library(HydeNet)


### Name: factorRegex
### Title: Produce Regular Expressions for Extracting Factor Names and
###   Levels
### Aliases: factorRegex

### ** Examples

data(PE, package = "HydeNet")
g6 <- glm(treat ~ d.dimer + angio, data=PE, family="binomial")
HydeNet:::factorRegex(g6)




