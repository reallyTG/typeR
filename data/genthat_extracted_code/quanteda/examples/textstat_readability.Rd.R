library(quanteda)


### Name: textstat_readability
### Title: Calculate readability
### Aliases: textstat_readability

### ** Examples

txt <- c(doc1 = "Readability zero one.  Ten, Eleven.", 
         doc2 = "The cat in a dilapidated tophat.")
textstat_readability(txt, "Flesch")
textstat_readability(txt, c("FOG", "FOG.PSK", "FOG.NRI"))

textstat_readability(data_corpus_inaugural[48:58], 
                     measure = c("Flesch.Kincaid", "Dale.Chall.old"))



