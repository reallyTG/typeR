library(psychotree)


### Name: bttree
### Title: Bradley-Terry Trees
### Aliases: bttree plot.bttree print.bttree predict.bttree itempar.bttree
### Keywords: tree

### ** Examples

o <- options(digits = 4)

## Germany's Next Topmodel 2007 data
data("Topmodel2007", package = "psychotree")

## BT tree
tm_tree <- bttree(preference ~ ., data = Topmodel2007, minsize = 5, ref = "Barbara")
plot(tm_tree, abbreviate = 1, yscale = c(0, 0.5))

## parameter instability tests in root node
library("strucchange")
sctest(tm_tree, node = 1)

## worth/item parameters in terminal nodes
itempar(tm_tree)

## CEMS university choice data
data("CEMSChoice", package = "psychotree")
summary(CEMSChoice$preference)

## BT tree
cems_tree <- bttree(preference ~ french + spanish + italian + study + work + gender + intdegree,
  data = CEMSChoice, minsize = 5, ref = "London")
plot(cems_tree, abbreviate = 1, yscale = c(0, 0.5))
itempar(cems_tree)

options(digits = o$digits)



