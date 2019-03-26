library(netgsa)


### Name: NetGSA
### Title: Network-based Gene Set Analysis
### Aliases: NetGSA

### ** Examples

set.seed(1)

## NetGSA with directed networks

## NetGSA with undirected networks
data(netgsaex2)

A = netgsaex2$A
B = netgsaex2$B
x = netgsaex2$x
y = netgsaex2$y

# -Not-run-
# fit = NetGSA(A, x, y, B, lklMethod="REML", directed=FALSE)




