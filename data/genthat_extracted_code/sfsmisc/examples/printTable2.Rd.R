library(sfsmisc)


### Name: printTable2
### Title: Add and Print Marginals for 2-way Contingency Tables
### Aliases: printTable2 margin2table print.margin2table
### Keywords: utilities

### ** Examples

margin2table(diag(4),,TRUE)
m <- diag(3); colnames(m) <- letters[1:3]
margin2table(m)
margin2table(m / sum(m))

data(HairEyeColor)
margin2table(HairEyeColor[,, "Male"])
printTable2(HairEyeColor[,, "Male"])
printTable2(HairEyeColor[,, "Female"])



