library(tidytext)


### Name: corpus_tidiers
### Title: Tidiers for a corpus object from the quanteda package
### Aliases: corpus_tidiers tidy.corpus glance.corpus

### ** Examples


if (requireNamespace("quanteda", quietly = TRUE)) {
 data("data_corpus_inaugural", package = "quanteda")

 data_corpus_inaugural

 tidy(data_corpus_inaugural)
}




