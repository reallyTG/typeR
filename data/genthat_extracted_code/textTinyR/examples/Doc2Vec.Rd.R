library(textTinyR)


### Name: Doc2Vec
### Title: Conversion of text documents to word-vector-representation
###   features ( Doc2Vec )
### Aliases: Doc2Vec
### Keywords: datasets

### ** Examples


library(textTinyR)

#---------------------------------
# tokenized text in form of a list
#---------------------------------

tok_text = list(c('the', 'result', 'of'), c('doc2vec', 'are', 'vector', 'features'))

#-------------------------
# path to the word vectors
#-------------------------

PATH = system.file("example_files", "word_vecs.txt", package = "textTinyR")


init = Doc2Vec$new(token_list = tok_text, word_vector_FILE = PATH)


out = init$doc2vec_methods(method = "sum_sqrt")



