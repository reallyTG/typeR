library(elastic)


### Name: tokenizer_set
### Title: Tokenizer operations
### Aliases: tokenizer_set

### ** Examples

## Not run: 
##D # set tokenizer
##D 
##D ## NGram tokenizer
##D body <- '{
##D         "settings" : {
##D              "analysis" : {
##D                  "analyzer" : {
##D                      "my_ngram_analyzer" : {
##D                          "tokenizer" : "my_ngram_tokenizer"
##D                      }
##D                  },
##D                  "tokenizer" : {
##D                      "my_ngram_tokenizer" : {
##D                          "type" : "nGram",
##D                          "min_gram" : "2",
##D                          "max_gram" : "3",
##D                          "token_chars": [ "letter", "digit" ]
##D                      }
##D                  }
##D              }
##D       }
##D }'
##D if (index_exists('test1')) index_delete('test1')
##D tokenizer_set(index = "test1", body=body)
##D index_analyze(text = "hello world", index = "test1", 
##D   analyzer='my_ngram_analyzer')
## End(Not run)



