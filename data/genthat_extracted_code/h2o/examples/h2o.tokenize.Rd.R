library(h2o)


### Name: h2o.tokenize
### Title: Tokenize String
### Aliases: h2o.tokenize

### ** Examples

## No test: 
library(h2o)
h2o.init()
string_to_tokenize <- as.h2o("Split at every character and tokenize.")
tokenize_string <- h2o.tokenize(as.character(string_to_tokenize), "")
## End(No test)



