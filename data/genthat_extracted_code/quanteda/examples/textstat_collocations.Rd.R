library(quanteda)


### Name: textstat_collocations
### Title: Identify and score multi-word expressions
### Aliases: textstat_collocations collocations is.collocations
### Keywords: collocations textstat

### ** Examples

txts <- data_corpus_inaugural[1:2]
head(cols <- textstat_collocations(txts, size = 2, min_count = 2), 10)
head(cols <- textstat_collocations(txts, size = 3, min_count = 2), 10)

# extracting multi-part proper nouns (capitalized terms)
toks2 <- tokens(data_corpus_inaugural)
toks2 <- tokens_remove(toks2, stopwords("english"), padding = TRUE)
toks2 <- tokens_select(toks2, "^([A-Z][a-z\\-]{2,})", valuetype = "regex", 
                       case_insensitive = FALSE, padding = TRUE)
seqs <- textstat_collocations(toks2, size = 3, tolower = FALSE)
head(seqs, 10)

# vectorized size
txt <- c(". . . . a b c . . a b c . . . c d e",
         "a b . . a b . . a b . . a b . a b",
         "b c d . . b c . b c . . . b c")
textstat_collocations(txt, size = 2:3)




