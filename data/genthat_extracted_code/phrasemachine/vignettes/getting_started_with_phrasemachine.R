## ----eval=FALSE----------------------------------------------------------
#  install.packages("phrasemachine")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("devtools")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("slanglab/phrasemachine/R/phrasemachine")

## ----eval=FALSE----------------------------------------------------------
#  library(phrasemachine)

## ----eval=TRUE, fig.width=6, fig.height=6, fig.align ='center'-----------
library(phrasemachine)
library(quanteda)

# load in U.S. presidential inaugural speeches from Quanteda example data.
documents <- quanteda::data_corpus_inaugural
# use first 10 documents for example
documents <- documents[1:10,]
# take a look at the document names
print(names(documents))

## ----eval=TRUE, fig.width=6, fig.height=6, fig.align ='center'-----------
# run phrasemachine
phrases <- phrasemachine(documents,
                         minimum_ngram_length = 2,
                         maximum_ngram_length = 8,
                         return_phrase_vectors = TRUE,
                         return_tag_sequences = TRUE)
# look at some example phrases
print(phrases[[1]]$phrases[1:10])

