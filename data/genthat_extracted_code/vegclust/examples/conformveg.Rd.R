library(vegclust)


### Name: conformveg
### Title: Conform two community data tables
### Aliases: conformveg

### ** Examples

## Loads data (38 columns and 33 species)
data(wetland)
dim(wetland)

## Splits wetland data into two matrices of 30x27 and 11x22
wetland.30 = wetland[1:30,]
wetland.30 = wetland.30[,colSums(wetland.30)>0]
dim(wetland.30)
wetland.11 = wetland[31:41,]
wetland.11 = wetland.11[,colSums(wetland.11)>0] 
dim(wetland.11)

## Conforms the two matrices so they can eventually be merged
wetland.cf = conformveg(wetland.30, wetland.11)
dim(wetland.cf$x)
dim(wetland.cf$y)
names(wetland.cf$x)==names(wetland.cf$y)



