library(googlenlp)


### Name: flatten_entities
### Title: Flatten entities
### Aliases: flatten_entities

### ** Examples

## Not run: 
##D sample_post <- gcnlp_post(text_body = "Google, headquartered in Mountain View, unveiled
##D                                        the new Android phone at the Consumer Electronic Show.
##D                                        Sundar Pichai said in his keynote that users love
##D                                        their new Android phones.",
##D                           extract_syntax = TRUE,
##D                           extract_entities = TRUE,
##D                           extract_document_sentiment = TRUE)
##D 
##D flatten_entities(entities_list = sample_post$content$entities)
## End(Not run)




