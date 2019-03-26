library(ruimtehol)


### Name: starspace_embedding
### Title: Get the document or ngram embeddings
### Aliases: starspace_embedding

### ** Examples

data(dekamer, package = "ruimtehol")
dekamer$text <- strsplit(dekamer$question, "\\W")
dekamer$text <- lapply(dekamer$text, FUN = function(x) setdiff(x, ""))
dekamer$text <- sapply(dekamer$text, 
                       FUN = function(x) paste(x, collapse = " "))

set.seed(123456789)
model <- embed_tagspace(x = tolower(dekamer$text), 
                        y = dekamer$question_theme_main, 
                        similarity = "dot",
                        early_stopping = 0.8, ngram = 1, p = 0.5,
                        dim = 10, minCount = 5)
embedding <- starspace_embedding(model, "federale politie", type = "document")
embedding_dictionary <- as.matrix(model)
embedding
colSums(embedding_dictionary[c("federale", "politie"), ]) / 2^0.5

## Not run: 
##D set.seed(123456789)
##D model <- embed_tagspace(x = tolower(dekamer$text), 
##D                         y = dekamer$question_theme_main, 
##D                         similarity = "cosine",
##D                         early_stopping = 0.8, ngram = 1, 
##D                         dim = 10, minCount = 5)
##D embedding <- starspace_embedding(model, "federale politie", type = "document")
##D embedding_dictionary <- as.matrix(model)
##D euclidean_norm <- function(x) sqrt(sum(x^2))
##D manual <- colSums(embedding_dictionary[c("federale", "politie"), ])
##D manual / euclidean_norm(manual)
##D embedding
##D 
##D set.seed(123456789)
##D model <- embed_tagspace(x = tolower(dekamer$text), 
##D                         y = dekamer$question_theme_main, 
##D                         similarity = "dot",
##D                         early_stopping = 0.8, ngram = 3, p = 0,
##D                         dim = 10, minCount = 5, bucket = 1)
##D starspace_embedding(model, "federale politie", type = "document")
##D starspace_embedding(model, "federale politie", type = "ngram")
## End(Not run)



