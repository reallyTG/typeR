library(googlenlp)


### Name: flatten_sentiment
### Title: Flatten sentiment
### Aliases: flatten_sentiment

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
##D flatten_sentiment(sentiment_list = sample_post$content$sentiment)
## End(Not run)




