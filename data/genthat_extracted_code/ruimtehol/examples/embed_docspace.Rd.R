library(ruimtehol)


### Name: embed_docspace
### Title: Build a Starspace model for content-based recommendation
### Aliases: embed_docspace

### ** Examples

library(udpipe)
data(dekamer, package = "ruimtehol")
data(dekamer_theme_terminology, package = "ruimtehol")
## Which person is interested in which theme (aka document)
x <- table(dekamer$aut_person, dekamer$question_theme_main)
x <- as.data.frame(x)
colnames(x) <- c("user_id", "doc_id", "freq")
## Characterise the themes (aka document)
docs <- split(dekamer_theme_terminology, dekamer_theme_terminology$theme)
docs <- lapply(docs, FUN=function(x){
  data.frame(theme = x$theme[1], text = paste(x$term, collapse = " "), 
             stringsAsFactors=FALSE)
})
docs <- do.call(rbind, docs)

## Build a model
train <- merge(x, docs, by.x = "doc_id", by.y = "theme")
train <- subset(train, user_id %in% sample(levels(train$user_id), 4))
set.seed(123456789)
model <- embed_docspace(train, dim = 10, early_stopping = 1)
plot(model)



