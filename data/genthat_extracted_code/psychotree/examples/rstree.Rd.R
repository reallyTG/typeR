library(psychotree)


### Name: rstree
### Title: Rating Scale Trees
### Aliases: rstree plot.rstree print.rstree predict.rstree itempar.rstree
###   threshpar.rstree
### Keywords: tree

### ** Examples

o <- options(digits = 4)

## verbal aggression data from package psychotools
data("VerbalAggression", package = "psychotools")

## responses to the first other-to-blame situation (bus)
VerbalAggression$s1 <- VerbalAggression$resp[, 1:6]

## exclude subjects who only scored in the highest or the lowest categories
VerbalAggression <- subset(VerbalAggression, rowSums(s1) > 0 & rowSums(s1) < 12)

## fit rating scale tree model for the first other-to-blame situation
rst <- rstree(s1 ~ anger + gender, data = VerbalAggression)

## print tree (with and without parameters)
print(rst)
print(rst, FUN = function(x) " *")

## show summary for terminal panel nodes
summary(rst)

## visualization
plot(rst, type = "regions")
plot(rst, type = "profile")

## extract item and threshold parameters
coef(rst)
itempar(rst)
threshpar(rst)

## inspect parameter stability tests in all splitting nodes
library("strucchange")
sctest(rst, node = 1)
sctest(rst, node = 2)

options(digits = o$digits)



