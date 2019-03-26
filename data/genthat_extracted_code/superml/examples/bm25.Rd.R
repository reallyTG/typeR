library(superml)


### Name: bm25
### Title: Best Matching(BM25)
### Aliases: bm25
### Keywords: datasets

### ** Examples

example <- c('white audi 2.5 car','black shoes from office',
             'new mobile iphone 7','audi tyres audi a3',
             'nice audi bmw toyota corolla')
get_bm <- bm25$new(example, use_parallel=FALSE)
input_document <- c('white toyota corolla')
get_bm$most_similar(document = input_document, topn = 2)



