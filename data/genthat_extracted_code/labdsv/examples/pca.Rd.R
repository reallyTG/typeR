library(labdsv)


### Name: pca
### Title: Principal Components Analysis
### Aliases: pca loadings.pca summary.pca scores.pca
### Keywords: multivariate

### ** Examples

    data(bryceveg) # returns a vegetation data.frame
    data(brycesite)
    x <- pca(bryceveg,dim=10)  # returns the first 10 eigenvectors and loadings
    plot(x)
    surf(x,brycesite$elev)
    points(x,brycesite$depth=='deep')



