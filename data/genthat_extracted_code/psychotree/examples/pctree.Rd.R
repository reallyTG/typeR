library(psychotree)


### Name: pctree
### Title: Partial Credit Trees
### Aliases: pctree plot.pctree print.pctree predict.pctree itempar.pctree
###   threshpar.pctree
### Keywords: tree

### ** Examples

o <- options(digits = 4)

## verbal aggression data from package psychotools
data("VerbalAggression", package = "psychotools")

## use response to the second other-to-blame situation (train)
VerbalAggression$s2 <- VerbalAggression$resp[, 7:12]

## exclude subjects who only scored in the highest or the lowest categories
VerbalAggression <- subset(VerbalAggression, rowSums(s2) > 0 & rowSums(s2) < 12)

## fit partial credit tree model
pct <- pctree(s2 ~ anger + gender, data = VerbalAggression)

## print tree (with and without parameters)
print(pct)
print(pct, FUN = function(x) " *")

## show summary for terminal panel nodes
summary(pct)

## visualization
plot(pct, type = "regions")
plot(pct, type = "profile")

## extract item and threshold parameters
coef(pct)
itempar(pct)
threshpar(pct)

## inspect parameter stability tests in the splitting node
library("strucchange")
sctest(pct, node = 1)

options(digits = o$digits)

## No test: 
## partial credit tree on artificial data from Komboz et al. (2018)
data("DIFSimPC", package = "psychotree")
pct2 <- pctree(resp ~ gender + age + motivation, data = DIFSimPC)
plot(pct2, ylim = c(-4.5, 4.5), names = paste("I", 1:8))
## End(No test)



