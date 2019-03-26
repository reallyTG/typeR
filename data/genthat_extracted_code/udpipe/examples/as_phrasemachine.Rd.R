library(udpipe)


### Name: as_phrasemachine
### Title: Convert Parts of Speech tags to one-letter tags which can be
###   used to identify phrases based on regular expressions
### Aliases: as_phrasemachine

### ** Examples

x <- c("PROPN", "SCONJ", "ADJ", "NOUN", "VERB", "INTJ", "DET", "VERB", 
       "PROPN", "AUX", "NUM", "NUM", "X", "SCONJ", "PRON", "PUNCT", "ADP", 
       "X", "PUNCT", "AUX", "PROPN", "ADP", "X", "PROPN", "ADP", "DET", 
       "CCONJ", "INTJ", "NOUN", "PROPN")
as_phrasemachine(x)



