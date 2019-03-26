library(psychotree)


### Name: raschtree
### Title: Rasch Trees
### Aliases: raschtree print.raschtree plot.raschtree predict.raschtree
###   itempar.raschtree
### Keywords: tree

### ** Examples

o <- options(digits = 4)

## artificial data
data("DIFSim", package = "psychotree")

## fit Rasch tree model
rt <- raschtree(resp ~ age + gender + motivation, data = DIFSim)
plot(rt)

## extract item parameters
coef(rt)
itempar(rt)

## inspect parameter stability tests in all splitting nodes
library("strucchange")
sctest(rt, node = 1)
sctest(rt, node = 2)

## highlight items 3 and 14 with DIF
ix <- rep(1, 20)
ix[c(3, 14)] <- 2
plot(rt, ylines = 2.5,  cex = c(0.4, 0.8)[ix], 
  pch = c(19, 19)[ix], col = gray(c(0.5, 0))[ix])

options(digits = o$digits)



