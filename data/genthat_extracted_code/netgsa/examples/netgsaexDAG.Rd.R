library(netgsa)


### Name: netgsaexDAG
### Title: Toy example for using 'NetGSA' on a two-class test with directed
###   acyclic graphs
### Aliases: netgsaexDAG
### Keywords: datasets

### ** Examples

data(netgsaexDAG)
A = netgsaexDAG$A
B = netgsaexDAG$B
x = netgsaexDAG$x
y = netgsaexDAG$y
fitDAG = NetGSA(A, x, y, B, lklMethod="REML", directed=TRUE)



