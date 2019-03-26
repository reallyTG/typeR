library(vegclust)


### Name: hcr
### Title: Heterogeneity-constrained random resampling (HCR)
### Aliases: hcr

### ** Examples

## Loads data (38 columns and 33 species)
data(wetland)
dim(wetland)
  
## Constructs the chord distance matrix
## (see also  \code{decostand} in package vegan)
wetland.chord =dist(as.data.frame(sweep(as.matrix(wetland), 1, 
                    sqrt(rowSums(as.matrix(wetland)^2)), "/")))

## Performs HCR resampling. Returns indices of objects
sel = hcr(wetland.chord, nout=20, nsampl=1000)

## Prints the names of the plot records
print(row.names(wetland)[sel])

## Subset the original distance matrix
sel.chord = as.dist(as.matrix(wetland.chord)[sel,sel])



