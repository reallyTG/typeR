library(crfsuite)


### Name: crf
### Title: Linear-chain Conditional Random Field
### Aliases: crf

### ** Examples

##
## Build Named Entity Recognition model on tiny - 10 docs subset of conll2002-nl
##
x         <- ner_download_modeldata("conll2002-nl", docs = 10)
x$pos     <- txt_sprintf("Parts of Speech: %s", x$pos)
x$token   <- txt_sprintf("Token: %s", x$token)
crf_train <- subset(x, data == "ned.train")
crf_test  <- subset(x, data == "testa")

model <- crf(y = crf_train$label, 
             x = crf_train[, c("token", "pos")], 
             group = crf_train$doc_id, 
             method = "lbfgs", 
             options = list(max_iterations = 3, feature.minfreq = 5, c1 = 0, c2 = 1)) 
model
stats <- summary(model, "modeldetails.txt")
stats
plot(stats$iterations$loss)

## Use the CRF model to label a sequence
scores <- predict(model, 
                  newdata = crf_test[, c("token", "pos")], 
                  group = crf_test$doc_id)
head(scores)
crf_test$label <- scores$label


## Not run: 
##D ##
##D ## More detailed example where text data was annotated with the webapp in the package
##D ## This data is joined with a tokenised dataset to construct the training data which
##D ## is further enriched with attributes of upos/lemma in the neighbourhood
##D ##
##D library(udpipe)
##D data(airbnb_chunks, package = "crfsuite")
##D udmodel <- udpipe_download_model("dutch-lassysmall")
##D udmodel <- udpipe_load_model(udmodel$file_model)
##D airbnb_tokens <- unique(airbnb_chunks[, c("doc_id", "text")])
##D airbnb_tokens <- udpipe_annotate(udmodel, 
##D                                  x = airbnb_tokens$text, 
##D                                  doc_id = airbnb_tokens$doc_id)
##D airbnb_tokens <- as.data.frame(airbnb_tokens)
##D x <- merge(airbnb_chunks, airbnb_tokens)
##D x <- crf_cbind_attributes(x, terms = c("upos", "lemma"), by = "doc_id")
##D model <- crf(y = x$chunk_entity, 
##D              x = x[, grep("upos|lemma", colnames(x), value = TRUE)], 
##D              group = x$doc_id, 
##D              method = "lbfgs", options = list(max_iterations = 5)) 
##D stats <- summary(model)
##D stats
##D plot(stats$iterations$loss, type = "b", xlab = "Iteration", ylab = "Loss")
##D scores <- predict(model, 
##D                   newdata = x[, grep("upos|lemma", colnames(x))], 
##D                   group = x$doc_id)
##D head(scores)
##D 
##D ## cleanup for CRAN
##D file.remove(udmodel$file)
## End(Not run)
file.remove(model$file_model)
file.remove("modeldetails.txt")



