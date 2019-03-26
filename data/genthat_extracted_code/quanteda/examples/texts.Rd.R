library(quanteda)


### Name: texts
### Title: Get or assign corpus texts
### Aliases: texts texts<- as.character.corpus
### Keywords: corpus

### ** Examples

nchar(texts(corpus_subset(data_corpus_inaugural, Year < 1806)))

# grouping on a document variable
nchar(texts(corpus_subset(data_corpus_inaugural, Year < 1806), groups = "President"))

# grouping a character vector using a factor
nchar(data_char_ukimmig2010[1:5])
nchar(texts(data_corpus_inaugural[1:5], 
            groups = as.factor(data_corpus_inaugural[1:5, "President"])))

BritCorpus <- corpus(c("We must prioritise honour in our neighbourhood.", 
                       "Aluminium is a valourous metal."))
texts(BritCorpus) <- 
    stringi::stri_replace_all_regex(texts(BritCorpus),
                                   c("ise", "([nlb])our", "nium"),
                                   c("ize", "$1or", "num"),
                                   vectorize_all = FALSE)
texts(BritCorpus)
texts(BritCorpus)[2] <- "New text number 2."
texts(BritCorpus)



