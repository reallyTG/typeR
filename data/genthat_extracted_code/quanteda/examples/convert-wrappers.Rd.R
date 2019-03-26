library(quanteda)


### Name: convert-wrappers
### Title: Convenience wrappers for dfm convert
### Aliases: convert-wrappers as.wfm as.DocumentTermMatrix dfm2lda
### Keywords: internal

### ** Examples

mycorpus <- corpus_subset(data_corpus_inaugural, Year > 1970)
quantdfm <- dfm(mycorpus, verbose = FALSE)

# shortcut conversion to austin package's wfm format
identical(as.wfm(quantdfm), convert(quantdfm, to = "austin"))

## Not run: 
##D # shortcut conversion to tm package's DocumentTermMatrix format
##D identical(as.DocumentTermMatrix(quantdfm), convert(quantdfm, to = "tm"))
## End(Not run)

## Not run: 
##D # shortcut conversion to lda package list format
##D identical(dfm2lda(quantdfm), convert(quantdfm, to = "lda")) 
## End(Not run)




