library(clValid)


### Name: annotationListToMatrix
### Title: Change annotation list to matrix
### Aliases: annotationListToMatrix
### Keywords: cluster

### ** Examples


data(mouse)
express <- mouse[1:25,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID[1:25]
fc <- tapply(rownames(express),mouse$FC[1:25], c)
fc <- fc[-match( c("EST","Unknown"), names(fc))]
fc <- annotationListToMatrix(fc, rownames(express))

## see package vignette for example use when reading from Excel file




