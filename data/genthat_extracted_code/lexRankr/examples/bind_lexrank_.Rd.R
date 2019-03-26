library(lexRankr)


### Name: bind_lexrank_
### Title: Bind lexrank scores to a dataframe of text
### Aliases: bind_lexrank_ bind_lexrank

### ** Examples


df <- data.frame(doc_id = 1:3, 
                 text = c("Testing the system. Second sentence for you.", 
                          "System testing the tidy documents df.", 
                          "Documents will be parsed and lexranked."),
                 stringsAsFactors = FALSE)

## Not run: 
##D library(magrittr)
##D 
##D df %>% 
##D   unnest_sentences(sents, text) %>% 
##D   bind_lexrank(sents, doc_id, level = "sentences")
##D 
##D df %>% 
##D   unnest_sentences(sents, text) %>% 
##D   bind_lexrank_("sents", "doc_id", level = "sentences")
##D 
##D df <- data.frame(doc_id  = c(1, 1, 1, 1, 1, 1, 1, 2, 2, 2,
##D                              2, 2, 2, 3, 3, 3, 3, 3, 3), 
##D                  sent_id = c(1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 
##D                              1, 1, 1, 1, 1, 1, 1, 1, 1), 
##D                  tokens = c("testing", "the", "system", "second", 
##D                             "sentence", "for", "you", "system", 
##D                             "testing", "the", "tidy", "documents", 
##D                             "df", "documents", "will", "be", "parsed", 
##D                             "and", "lexranked"),
##D                  stringsAsFactors = FALSE)
##D 
##D df %>% 
##D   bind_lexrank(tokens, doc_id, sent_id, level = 'tokens')
## End(Not run)



