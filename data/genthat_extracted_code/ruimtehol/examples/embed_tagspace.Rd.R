library(ruimtehol)


### Name: embed_tagspace
### Title: Build a Starspace model to be used for classification purposes
### Aliases: embed_tagspace

### ** Examples

data(dekamer, package = "ruimtehol")
dekamer <- subset(dekamer, depotdat < as.Date("2017-02-01"))
dekamer$text <- strsplit(dekamer$question, "\\W")
dekamer$text <- lapply(dekamer$text, FUN = function(x) setdiff(x, ""))
dekamer$text <- sapply(dekamer$text, 
                       FUN = function(x) paste(x, collapse = " "))
dekamer$question_theme_main <- gsub(" ", "-", dekamer$question_theme_main)

set.seed(123456789)
model <- embed_tagspace(x = tolower(dekamer$text), 
                        y = dekamer$question_theme_main, 
                        early_stopping = 0.8, 
                        dim = 10, minCount = 5)
plot(model)
predict(model, "de nmbs heeft het treinaanbod uitgebreid", k = 3)
predict(model, "de migranten komen naar europa, in asielcentra ...")
starspace_embedding(model, "de nmbs heeft het treinaanbod uitgebreid")
starspace_embedding(model, "__label__MIGRATIEBELEID", type = "ngram")

dekamer$question_themes <- gsub(" ", "-", dekamer$question_theme)
dekamer$question_themes <- strsplit(dekamer$question_themes, split = ",")
set.seed(123456789)
model <- embed_tagspace(x = tolower(dekamer$text), 
                        y = dekamer$question_themes, 
                        early_stopping = 0.8,
                        dim = 50, minCount = 2, epoch = 50)
plot(model)
predict(model, "de nmbs heeft het treinaanbod uitgebreid")
predict(model, "de migranten komen naar europa , in asielcentra ...")
embeddings_labels <- as.matrix(model, type = "labels")
emb <- starspace_embedding(model, "de nmbs heeft het treinaanbod uitgebreid")
embedding_similarity(emb, embeddings_labels, type = "cosine", top_n = 5)



