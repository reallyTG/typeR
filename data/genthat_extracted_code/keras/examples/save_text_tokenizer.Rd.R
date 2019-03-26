library(keras)


### Name: save_text_tokenizer
### Title: Save a text tokenizer to an external file
### Aliases: save_text_tokenizer load_text_tokenizer

### ** Examples

## Not run: 
##D 
##D # vectorize texts then save for use in prediction
##D tokenizer <- text_tokenizer(num_words = 10000) %>% 
##D fit_text_tokenizer(tokenizer, texts)
##D save_text_tokenizer(tokenizer, "tokenizer")
##D 
##D # (train model, etc.)
##D 
##D # ...later in another session
##D tokenizer <- load_text_tokenizer("tokenizer")
##D 
##D # (use tokenizer to preprocess data for prediction)
##D 
## End(Not run)




