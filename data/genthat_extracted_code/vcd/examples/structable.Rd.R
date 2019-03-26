library(vcd)


### Name: structable
### Title: Structured Contingency Tables
### Aliases: structable.default structable.formula structable
###   Extract.structable aperm.structable t.structable is.structable
###   cbind.structable rbind.structable length.structable is.na.structable
###   as.matrix.structable as.vector.structable dim.structable
###   dimnames.structable as.table.structable
### Keywords: hplot

### ** Examples

structable(Titanic)
structable(Titanic, split_vertical = c(TRUE, TRUE, FALSE, FALSE))
structable(Titanic, direction = c("h","h","v","v"))
structable(Sex + Class ~ Survived + Age, data = Titanic)

## subsetting of structable objects
(hec <- structable(aperm(HairEyeColor)))

## The "[" operator treats structables as a block-matrix and selects parts of the matrix:
hec[1]
hec[2]
hec[1,c(2,4)]
hec["Male",c("Blue","Green")]

## replacement funcion:
tmp <- hec
(tmp[1,2:3] <- tmp[2,c(1,4)])

## In contrast, the "[[" operator treats structables as two-dimensional
## lists. Indexing conditions on specified levels and thus reduces the dimensionality:

## seek subtables conditioning on levels of the first dimension:
hec[[1]]
hec[[2]]

## Seek subtable from the first two dimensions, given the level "Male"
## of the first variable, and "Brown" from the second
## (the following two commands are equivalent):
hec[["Male"]][["Brown"]]
hec[[c("Male","Brown")]]

## Seeking subtables by conditioning on row and/or column variables:
hec[["Male","Hazel"]]
hec[[c("Male","Brown"),]]
hec[[c("Male","Brown"),"Hazel"]]

## a few other operations
t(hec)
dim(hec)
dimnames(hec)
as.matrix(hec)
length(hec)
cbind(hec[,1],hec[,3])

as.vector(hec) ## computed on the _multiway_ table
as.vector(unclass(hec))



