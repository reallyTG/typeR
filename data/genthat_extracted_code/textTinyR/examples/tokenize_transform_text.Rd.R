library(textTinyR)


### Name: tokenize_transform_text
### Title: String tokenization and transformation ( character string or
###   path to a file )
### Aliases: tokenize_transform_text

### ** Examples


library(textTinyR)

token_str = "CONVERT to lower, remove.. punctuation11234, trim token and split "

res = tokenize_transform_text(object = token_str, to_lower = TRUE, split_string = TRUE)



