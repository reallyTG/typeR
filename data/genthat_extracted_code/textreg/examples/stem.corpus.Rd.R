library(textreg)


### Name: stem.corpus
### Title: Step corpus with annotation.
### Aliases: stem.corpus

### ** Examples

## No test: 
 
library( tm )
texts <- c("texting goblins the dagger", "text these goblins", 
            "texting 3 goblins appl daggers goblining gobble")
corpus <- VCorpus(VectorSource(texts))
stemmed_corpus<-stem.corpus(corpus, verbose=FALSE)
inspect( stemmed_corpus[[2]] )
## End(No test)



