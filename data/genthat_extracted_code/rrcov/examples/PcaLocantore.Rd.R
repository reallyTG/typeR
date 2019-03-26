library(rrcov)


### Name: PcaLocantore
### Title: Spherical Principal Components
### Aliases: PcaLocantore PcaLocantore.formula PcaLocantore.default
### Keywords: robust multivariate

### ** Examples

## PCA of the Hawkins Bradu Kass's Artificial Data
##  using all 4 variables
    data(hbk)
    pca <- PcaLocantore(hbk)
    pca

## Compare with the classical PCA
    prcomp(hbk)

## or  
    PcaClassic(hbk)
    
## If you want to print the scores too, use
    print(pca, print.x=TRUE)

## Using the formula interface
    PcaLocantore(~., data=hbk)

## To plot the results:

    plot(pca)                    # distance plot
    pca2 <- PcaLocantore(hbk, k=2)  
    plot(pca2)                   # PCA diagnostic plot (or outlier map)
    
## Use the standard plots available for for prcomp and princomp
    screeplot(pca)    
    biplot(pca)    



