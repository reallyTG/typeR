library(fossil)


### Name: create.matrix
### Title: Creating species locality matrices
### Aliases: create.matrix
### Keywords: data

### ** Examples

#converting the fdata.list dataset into a matrix of species (rows) 
#by samples (columns) with abundance data
data(fdata.list)
create.matrix(fdata.list, tax.name = "species", locality = "locality", 
 abund=TRUE, abund.col="abundance")

#same data set, but now for an occurrence matrix
create.matrix(fdata.list, tax.name = "species", locality = "locality")




