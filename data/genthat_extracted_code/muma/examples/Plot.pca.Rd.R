library(muma)


### Name: Plot.pca
### Title: principal component analysis plotting
### Aliases: Plot.pca
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function (pcx, pcy, scaling, test.outlier = TRUE) 
{
    Plot.pca.score(pcx, pcy, scaling)
    Plot.pca.loading(pcx, pcy, scaling)
    if (test.outlier) {
        outlier(pcx, pcy, scaling)
    }
  }



