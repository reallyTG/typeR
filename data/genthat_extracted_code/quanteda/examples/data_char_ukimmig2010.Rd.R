library(quanteda)


### Name: data_char_ukimmig2010
### Title: Immigration-related sections of 2010 UK party manifestos
### Aliases: data_char_ukimmig2010
### Keywords: data

### ** Examples

data_corpus_ukimmig2010 <- 
    corpus(data_char_ukimmig2010, 
           docvars = data.frame(party = names(data_char_ukimmig2010)))
metadoc(data_corpus_ukimmig2010, "language") <- "english"
summary(data_corpus_ukimmig2010, showmeta = TRUE)



