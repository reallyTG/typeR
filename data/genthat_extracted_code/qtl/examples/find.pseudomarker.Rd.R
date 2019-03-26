library(qtl)


### Name: find.pseudomarker
### Title: Find the pseudomarker closest to a specified position
### Aliases: find.pseudomarker
### Keywords: utilities

### ** Examples

data(listeria)
listeria <- calc.genoprob(listeria, step=2.5)
find.pseudomarker(listeria, 5, 28, "prob")
find.pseudomarker(listeria, c(1, 5, 13), c(81, 28, 26), "prob")



