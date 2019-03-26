library(quanteda)


### Name: corpus-class
### Title: Base method extensions for corpus objects
### Aliases: corpus-class print.corpus is.corpus is.corpuszip
###   print.summary.corpus +.corpus c.corpus [.corpus [[.corpus [[<-.corpus
###   str.corpus
### Keywords: corpus internal

### ** Examples


# concatenate corpus objects
corpus1 <- corpus(data_char_ukimmig2010[1:2])
corpus2 <- corpus(data_char_ukimmig2010[3:4])
corpus3 <- corpus(data_char_ukimmig2010[5:6])
summary(c(corpus1, corpus2, corpus3))

# ways to index corpus elements
data_corpus_inaugural["1793-Washington"]    # 2nd Washington inaugural speech
data_corpus_inaugural[2]                    # same
# access the docvars from data_corpus_irishbudget2010
data_corpus_irishbudget2010[, "year"]
# same
data_corpus_irishbudget2010[["year"]]            

# create a new document variable
data_corpus_irishbudget2010[["govtopp"]] <- 
    ifelse(data_corpus_irishbudget2010[["party"]] %in% c("FF", "Greens"), 
           "Government", "Opposition")
docvars(data_corpus_irishbudget2010)



