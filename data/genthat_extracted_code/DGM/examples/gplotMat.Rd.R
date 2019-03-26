library(DGM)


### Name: gplotMat
### Title: Plots network as adjacency matrix.
### Aliases: gplotMat

### ** Examples

# Generate some sample binary 5-node network structures for N=20, then compute
# proportion at each edge
N=20
x = array(rbinom(n=5*5*N, size=1, prob=0.30), dim=c(5,5,N))
A = apply(x, c(1,2), mean)
## No test: 
gplotMat(A, title = "network", colMapLabel = '%', barWidth = 0.3)
## End(No test)




