library(lexRankr)


### Name: unnest_sentences_
### Title: Split a column of text into sentences
### Aliases: unnest_sentences_ unnest_sentences

### ** Examples


df <- data.frame(doc_id = 1:3, 
                 text = c("Testing the system. Second sentence for you.", 
                          "System testing the tidy documents df.", 
                          "Documents will be parsed and lexranked."),
                 stringsAsFactors=FALSE)

unnest_sentences(df, sents, text)
unnest_sentences_(df, "sents", "text")

## Not run: 
##D library(magrittr)
##D 
##D df %>% 
##D   unnest_sentences(sents, text)
## End(Not run)



