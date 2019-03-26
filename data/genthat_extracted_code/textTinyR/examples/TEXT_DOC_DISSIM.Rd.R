library(textTinyR)


### Name: TEXT_DOC_DISSIM
### Title: Dissimilarity calculation of text documents
### Aliases: TEXT_DOC_DISSIM

### ** Examples


## Not run: 
##D 
##D library(textTinyR)
##D 
##D 
##D # example input LSI matrices (see details section)
##D #-------------------------------------------------
##D 
##D set.seed(1)
##D LSI_matrix1 = matrix(runif(10000), 100, 100)
##D 
##D set.seed(2)
##D LSI_matrix2 = matrix(runif(10000), 100, 100)
##D 
##D 
##D txt_out = TEXT_DOC_DISSIM(first_matr = LSI_matrix1,
##D 
##D                           second_matr = LSI_matrix2, 'euclidean')
## End(Not run)



