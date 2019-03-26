library(textTinyR)


### Name: sparse_term_matrix
### Title: Term matrices and statistics ( document-term-matrix,
###   term-document-matrix)
### Aliases: sparse_term_matrix
### Keywords: datasets

### ** Examples


library(textTinyR)


# sm <- sparse_term_matrix$new(file_data = "/folder/my_data.txt",

#                              document_term_matrix = TRUE)

#--------------
# term matrix :
#--------------

# sm$Term_Matrix(sort_terms = TRUE, to_lower = TRUE,

#                trim_token = TRUE, split_string = TRUE,

#                remove_stopwords = TRUE, normalize = 'l1',

#                stemmer = 'porter2_stemmer', threads = 1 )

#---------------
# triplet data :
#---------------

# sm$triplet_data()


#----------------------
# global-term-weights :
#----------------------

# sm$global_term_weights()


#-------------------------
# removal of sparse terms:
#-------------------------

# sm$Term_Matrix_Adjust(sparsity_thresh = 0.995)


#-----------------------------------------------
# associations between terms of a sparse matrix:
#-----------------------------------------------


# sm$term_associations(Terms = c("word", "sentence"), keep_terms = 10)


#---------------------------------------------
# most frequent terms using the sparse matrix:
#---------------------------------------------


# sm$most_frequent_terms(keep_terms = 10, threads = 1)



