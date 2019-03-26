library(ruimtehol)


### Name: predict.textspace
### Title: Predict using a Starspace model
### Aliases: predict.textspace

### ** Examples

data(dekamer, package = "ruimtehol")
dekamer$text <- strsplit(dekamer$question, "\\W")
dekamer$text <- lapply(dekamer$text, FUN = function(x) setdiff(x, ""))
dekamer$text <- sapply(dekamer$text, 
                       FUN = function(x) paste(x, collapse = " "))

idx <- sample(nrow(dekamer), size = round(nrow(dekamer) * 0.9))
traindata <- dekamer[idx, ]
testdata <- dekamer[-idx, ]
set.seed(123456789)
model <- embed_tagspace(x = traindata$text, 
                        y = traindata$question_theme_main, 
                        early_stopping = 0.8,
                        dim = 10, minCount = 5)
scores <- predict(model, testdata)                        
scores <- predict(model, testdata, type = "labels")
str(scores)
emb <- predict(model, testdata[, c("doc_id", "text")], type = "embedding")
knn <- predict(model, testdata[1:5, c("doc_id", "text")], type = "knn", k=3)


## Not run: 
##D library(udpipe)
##D data(dekamer, package = "ruimtehol")
##D dekamer <- subset(dekamer, question_theme_main == "DEFENSIEBELEID")
##D x <- udpipe(dekamer$question, "dutch", tagger = "none", parser = "none", trace = 100)
##D x <- x[, c("doc_id", "sentence_id", "sentence", "token")]
##D set.seed(123456789)
##D model <- embed_sentencespace(x, dim = 15, epoch = 5, minCount = 5)
##D scores <- predict(model, "Wat zijn de cijfers qua doorstroming van 2016?", 
##D                   basedoc = unique(x$sentence), k = 3) 
##D str(scores)
##D 
##D #' ## clean up for cran
##D file.remove(list.files(pattern = ".udpipe$"))
## End(Not run)



