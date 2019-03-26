library(rrcov)


### Name: PcaCov
### Title: Robust PCA based on a robust covariance matrix
### Aliases: PcaCov PcaCov.formula PcaCov.default
### Keywords: robust multivariate

### ** Examples

## PCA of the Hawkins Bradu Kass's Artificial Data
##  using all 4 variables
    data(hbk)
    pca <- PcaCov(hbk)
    pca

## Compare with the classical PCA
    prcomp(hbk)

## or  
    PcaClassic(hbk)
    
## If you want to print the scores too, use
    print(pca, print.x=TRUE)

## Using the formula interface
    PcaCov(~., data=hbk)

## To plot the results:

    plot(pca)                    # distance plot
    pca2 <- PcaCov(hbk, k=2)  
    plot(pca2)                   # PCA diagnostic plot (or outlier map)
    
## Use the standard plots available for for prcomp and princomp
    screeplot(pca)    
    biplot(pca)    



