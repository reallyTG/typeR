library(mefa)


### Name: mefaCheck
### Title: Check and Compare Object(s) of Class 'mefa'
### Aliases: mefaCheck mefaCompare
### Keywords: manip

### ** Examples

x <- matrix(rpois(20,1), 5, 4)
m <- mefa(x)
mefaCheck(m)
data(dol.count)
x1 <- mefa(stcs(dol.count))
x2 <- mefa(melt(x1))
mefaCompare(x1, x2)
mefaCompare(x1, x2, strict = TRUE)



