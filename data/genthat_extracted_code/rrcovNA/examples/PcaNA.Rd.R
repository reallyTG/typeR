library(rrcovNA)


### Name: PcaNA
### Title: Classical or robust Principal Components for incomplete data
### Aliases: PcaNA PcaNA.formula PcaNA.default
### Keywords: robust multivariate

### ** Examples

## 1. With complete data
## PCA of the bushfire data
    data(bushfire)
    pca <- PcaNA(bushfire)
    pca

## Compare with the classical PCA
    prcomp(bushfire)

## or  
    PcaNA(bushfire, method="class")
    
## If you want to print the scores too, use
    print(pca, print.x=TRUE)

## Using the formula interface
    PcaNA(~., data=bushfire)

## To plot the results:

    plot(pca)                    # distance plot
    pca2 <- PcaNA(bushfire, k=2)  
    plot(pca2)                   # PCA diagnostic plot (or outlier map)
    
## Use the standard plots available for for prcomp and princomp
    screeplot(pca)    
    biplot(pca)  

################################################################      
## 2. Now the same wit incomplete data - bush10
    data(bush10)
    pca <- PcaNA(bush10)
    pca

## Compare with the classical PCA
    PcaNA(bush10, method="class")
    
## If you want to print the scores too, use
    print(pca, print.x=TRUE)

## Using the formula interface
    PcaNA(~., data=as.data.frame(bush10))

## To plot the results:

    plot(pca)                    # distance plot
    pca2 <- PcaNA(bush10, k=2)  
    plot(pca2)                   # PCA diagnostic plot (or outlier map)
    
## Use the standard plots available for for prcomp and princomp
    screeplot(pca)    
    biplot(pca)    
    



