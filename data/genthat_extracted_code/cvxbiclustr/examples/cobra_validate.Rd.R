library(cvxbiclustr)


### Name: cobra_validate
### Title: Perform validation to select regularization parameter
### Aliases: cobra_validate

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
nGamma <- 7
gammaSeq <- 10**seq(0,1,length.out=nGamma)

## Generate solution path
sol <- cobra_validate(X,E_row,E_col,w_row,w_col,gammaSeq,fraction=0.01)

## Plot validation error
verr <- sol$validation_error
plot(verr)

## Heatmap of data smoothed at the model selected to minimize validation error
ix <- which.min(verr)
groups_row <- sol$groups_row[[ix]]
groups_col <- sol$groups_col[[ix]]
M <- biclust_smooth(X,groups_row,groups_col)
heatmap(M,col=hmcols,labRow=NA,labCol=NA,ColSideCol=cols[ty])



