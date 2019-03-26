library(quanteda)


### Name: textstat_lexdiv
### Title: Calculate lexical diversity
### Aliases: textstat_lexdiv

### ** Examples

mydfm <- dfm(corpus_subset(data_corpus_inaugural, Year > 1980), verbose = FALSE)
(result <- textstat_lexdiv(mydfm, c("CTTR", "TTR", "U")))
cor(textstat_lexdiv(mydfm, "all")[,-1])




