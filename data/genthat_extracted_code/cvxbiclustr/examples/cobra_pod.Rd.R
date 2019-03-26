library(cvxbiclustr)


### Name: cobra_pod
### Title: MM algorithm for Convex Biclustering with Missing Data
### Aliases: cobra_pod

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

## Generate random initial dual variables
set.seed(12345)
n <- ncol(X); p <- nrow(X)
m_row <- nrow(E_row); m_col <- nrow(E_col)
Lambda_row <- matrix(rnorm(n*m_row),n,m_row)
Lambda_col <- matrix(rnorm(p*m_col),p,m_col)

#### Initialize path parameters and structures
gam <- 200

## Create random mask
nMissing <- floor(0.1*n*p)
Theta <- sample(1:(n*p), nMissing, replace=FALSE)

sol <- cobra_pod(X,Lambda_row,Lambda_col,E_row,E_col,gam*w_row,gam*w_col,Theta)

heatmap(sol$U,col=hmcols,labRow=NA,labCol=NA,ColSideCol=cols[ty])



