library(quanteda)


### Name: corpus_reshape
### Title: Recast the document units of a corpus
### Aliases: corpus_reshape
### Keywords: corpus

### ** Examples

# simple example
corp <- corpus(c(textone = "This is a sentence.  Another sentence.  Yet another.", 
                 textwo = "Premiere phrase.  Deuxieme phrase."), 
                 docvars = data.frame(country=c("UK", "USA"), year=c(1990, 2000)),
                 metacorpus = list(notes = "Example showing how corpus_reshape() works."))
summary(corp)
summary(corpus_reshape(corp, to = "sentences"), showmeta = TRUE)

# example with inaugural corpus speeches
(corp2 <- corpus_subset(data_corpus_inaugural, Year>2004))
corp2_para <- corpus_reshape(corp2, to="paragraphs")
corp2_para
summary(corp2_para, 100, showmeta = TRUE)
## Note that Bush 2005 is recorded as a single paragraph because that text 
## used a single \n to mark the end of a paragraph.



