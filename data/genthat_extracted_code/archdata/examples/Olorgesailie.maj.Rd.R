library(archdata)


### Name: Olorgesailie.maj
### Title: Major stone tool classes, Olorgesailie, Kenya
### Aliases: Olorgesailie.maj
### Keywords: datasets

### ** Examples

data(Olorgesailie.maj)
# Chi square after removing the first two columns and simulating the p
# value since there are a number of very small expected values
chisq.test(Olorgesailie.maj, simulate.p.value=TRUE)
# Compute percentages over the localities
Olor.pct <- prop.table(as.matrix(Olorgesailie.maj), 1)*100
boxplot(Olor.pct)



