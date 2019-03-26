library(propOverlap)


### Name: RDC
### Title: Assiging the Relative Dominant Class.
### Aliases: RDC
### Keywords: univar

### ** Examples

data(lung)
Class           <- lung[12534,]   #define the observations' class labels
Gene.Masks      <- GMask(lung[1:12533,], CI.emprical(lung[1:12533,], Class), Class)
RelativeDC      <- RDC(Gene.Masks, Class)
RelativeDC[1:10]                  #show the relative dominant classes for the first 10 features
table(RelativeDC)                 #show the number of assignments for each class



