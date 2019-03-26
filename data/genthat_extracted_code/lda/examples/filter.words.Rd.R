library(lda)


### Name: filter.words
### Title: Functions to manipulate text corpora in LDA format.
### Aliases: filter.words concatenate.documents shift.word.indices
### Keywords: utilities

### ** Examples

data(cora.documents)

## Just use a small subset for the example.
corpus <- cora.documents[1:6]
## Get the word counts.
wc <- word.counts(corpus)

## Only keep the words which occur more than 4 times.
filtered <- filter.words(corpus,
                         as.numeric(names(wc)[wc <= 4]))
## [[1]]
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1   23   34   37   44
## [2,]    4    1    3    4    1
##
## [[2]]
##      [,1] [,2]
## [1,]   34   94
## [2,]    1    1
## ... long output ommitted ...

## Shift the second half of the corpus.
shifted <- shift.word.indices(filtered[4:6], 100)
## [[1]]
##      [,1] [,2] [,3]
## [1,]  134  281  307
## [2,]    2    5    7
##
## [[2]]
##      [,1] [,2]
## [1,]  101  123
## [2,]    1    4
##
## [[3]]
##      [,1] [,2]
## [1,]  101  194
## [2,]    6    3

## Combine the unshifted documents and the shifted documents.
concatenate.documents(filtered[1:3], shifted)
## [[1]]
##      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8]
## [1,]    1   23   34   37   44  134  281  307
## [2,]    4    1    3    4    1    2    5    7
##
## [[2]]
##      [,1] [,2] [,3] [,4]
## [1,]   34   94  101  123
## [2,]    1    1    1    4
##
## [[3]]
##      [,1] [,2] [,3] [,4] [,5] [,6]
## [1,]   34   37   44   94  101  194
## [2,]    4    1    7    1    6    3




