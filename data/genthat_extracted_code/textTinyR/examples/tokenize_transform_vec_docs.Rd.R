library(textTinyR)


### Name: tokenize_transform_vec_docs
### Title: String tokenization and transformation ( vector of documents )
### Aliases: tokenize_transform_vec_docs

### ** Examples


library(textTinyR)

token_doc_vec = c("CONVERT to lower", "remove.. punctuation11234", "trim token and split ")

res = tokenize_transform_vec_docs(object = token_doc_vec, to_lower = TRUE, split_string = TRUE)



