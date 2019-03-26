library(lda)


### Name: lexicalize
### Title: Generate LDA Documents from Raw Text
### Aliases: lexicalize
### Keywords: file

### ** Examples

## Generate an example.
example <- c("I am the very model of a modern major general",
             "I have a major headache")

corpus <- lexicalize(example, lower=TRUE)

## corpus$documents:
## $documents[[1]]
##      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
## [1,]    0    1    2    3    4    5    6    7    8     9
## [2,]    1    1    1    1    1    1    1    1    1     1
## 
## $documents[[2]]
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    0   10    6    8   11
## [2,]    1    1    1    1    1

## corpus$lexicon:
## $vocab
## [1] "i"        "am"       "the"      "very"     "model"    "of"      
## [7] "a"        "modern"   "major"    "general"  "have"     "headache"

## Only keep words that appear at least twice:
to.keep <- corpus$vocab[word.counts(corpus$documents, corpus$vocab) >= 2]

## Re-lexicalize, using this subsetted vocabulary
documents <- lexicalize(example, lower=TRUE, vocab=to.keep)

## documents:
## [[1]]
##      [,1] [,2] [,3]
## [1,]    0    1    2
## [2,]    1    1    1
## 
## [[2]]
##      [,1] [,2] [,3]
## [1,]    0    1    2
## [2,]    1    1    1



