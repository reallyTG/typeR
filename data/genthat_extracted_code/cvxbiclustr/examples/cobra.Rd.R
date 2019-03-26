library(cvxbiclustr)


### Name: cobra
### Title: Convex Biclustering Algorithm
### Aliases: cobra

### ** Examples

## Create bicluster path
## Example: Lung
X <- lung
X <- X - mean(X)
X <- X/norm(X,'f')

## Create annotation for heatmap
types <- colnames(lung)
ty <- as.numeric(factor(types))
cols <- rainbow(4)
YlGnBu5 <- c('#ffffd9','#c7e9b4','#41b6c4','#225ea8','#081d58')
hmcols <- colorRampPalette(YlGnBu5)(256)

## Construct weights and edge-incidence matrices
phi <- 0.5; k <- 5
wts <- gkn_weights(X,phi=phi,k_row=k,k_col=k)
w_row <- wts$w_row
w_col <- wts$w_col
E_row <- wts$E_row
E_col <- wts$E_col

## Connected Components of Row and Column Graphs
wts$nRowComp
wts$nColComp

#### Initialize path parameters and structures
nGamma <- 5
gammaSeq <- 10**seq(0,3,length.out=nGamma)

## Generate solution path
sol <- cobra_validate(X,E_row,E_col,w_row,w_col,gammaSeq)

ix <- 4
heatmap(sol$U[[ix]],col=hmcols,labRow=NA,labCol=NA,ColSideCol=cols[ty])



