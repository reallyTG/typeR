library(scrime)


### Name: knncatimputeLarge
### Title: Missing Value Imputation with kNN for High-Dimensional Data
### Aliases: knncatimputeLarge
### Keywords: classif NA

### ** Examples
## Not run: 
##D # Generate a data set consisting of 100 columns and 2000 rows (actually,
##D # knncatimputeLarge is made for much larger data sets), where the values
##D # are randomly drawn from the integers 1, 2, and 3.
##D # Afterwards, remove 200 of the observations randomly.
##D 
##D mat <- matrix(sample(3, 200000, TRUE), 2000)
##D mat[sample(200000, 20)] <- NA
##D 
##D # Apply knncatimputeLarge to mat to remove the missing values.
##D 
##D mat2 <- knncatimputeLarge(mat)
##D sum(is.na(mat))
##D sum(is.na(mat2))
##D 
##D # Now assume that the first 100 rows belong to SNPs from chromosome 1,
##D # the second 100 rows to SNPs from chromosome 2, and so on.
##D 
##D chromosome <- rep(1:20, e = 100)
##D 
##D # Apply knncatimputeLarge to mat chromosomewise, i.e. only consider
##D # the SNPs that belong to the same chromosome when replacing missing
##D # genotypes.
##D 
##D mat4 <- knncatimputeLarge(mat, fac = chromosome)
##D 
## End(Not run)


