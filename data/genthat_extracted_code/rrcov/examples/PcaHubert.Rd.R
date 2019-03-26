library(rrcov)


### Name: PcaHubert
### Title: ROBPCA - ROBust method for Principal Components Analysis
### Aliases: PcaHubert PcaHubert.formula PcaHubert.default
### Keywords: robust multivariate

### ** Examples

## PCA of the Hawkins Bradu Kass's Artificial Data
##  using all 4 variables
    data(hbk)
    pca <- PcaHubert(hbk)
    pca

## Compare with the classical PCA
    prcomp(hbk)

## or  
    PcaClassic(hbk)
    
## If you want to print the scores too, use
    print(pca, print.x=TRUE)

## Using the formula interface
    PcaHubert(~., data=hbk)

## To plot the results:

    plot(pca)                    # distance plot
    pca2 <- PcaHubert(hbk, k=2)  
    plot(pca2)                   # PCA diagnostic plot (or outlier map)
    
## Use the standard plots available for prcomp and princomp
    screeplot(pca)    
    biplot(pca)    
    
## Restore the covraiance matrix     
    py <- PcaHubert(hbk)
    cov.1 <- py@loadings %*% diag(py@eigenvalues) %*% t(py@loadings)
    cov.1    



