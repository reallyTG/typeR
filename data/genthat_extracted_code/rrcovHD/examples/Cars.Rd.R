library(rrcovHD)


### Name: Cars
### Title: Consumer reports car data: dimensions
### Aliases: Cars
### Keywords: datasets

### ** Examples

    data(Cars)

## Plot a pairwise scaterplot matrix
    pairs(Cars[,1:6])

    mcd <- CovMcd(Cars[,1:6])    
    plot(mcd, which="pairs")
    
## Start with robust PCA
    pca <- PcaHubert(Cars, k=ncol(Cars), kmax=ncol(Cars))
    pca

## Compare with the classical PCA
    prcomp(Cars)

## or  
    PcaClassic(Cars, k=ncol(Cars), kmax=ncol(Cars))
    
## If you want to print the scores too, use
    print(pca, print.x=TRUE)

## Using the formula interface
    PcaHubert(~., data=Cars, k=ncol(Cars), kmax=ncol(Cars))

## To plot the results:

    plot(pca)                    # distance plot
    pca2 <- PcaHubert(Cars, k=4)  
    plot(pca2)                   # PCA diagnostic plot (or outlier map)
    
## Use the standard plots available for prcomp and princomp
    screeplot(pca)    # it is interesting with all variables    
    biplot(pca)       # for biplot we need more than one PCs
    
## Restore the covraiance matrix     
    py <- PcaHubert(Cars, k=ncol(Cars), kmax=ncol(Cars))
    cov.1 <- py@loadings %*% diag(py@eigenvalues) %*% t(py@loadings)
    cov.1      




