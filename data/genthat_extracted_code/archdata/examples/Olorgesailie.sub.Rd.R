library(archdata)


### Name: Olorgesailie.sub
### Title: Stone tool subclasses, Olorgesailie, Kenya
### Aliases: Olorgesailie.sub
### Keywords: datasets

### ** Examples

data(Olorgesailie.sub)
# Chi square after removing the first two columns and simulating the p
# value since there are a number of very small expected values
chisq.test(Olorgesailie.sub[,3:18], simulate.p.value=TRUE)
# Compute percentages over the localities
Olor.pct <- prop.table(as.matrix(Olorgesailie.sub[,3:18]), 1)*100
boxplot(Olor.pct, cex.axis=.7)



