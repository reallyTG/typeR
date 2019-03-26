library(crfsuite)


### Name: predict.crf
### Title: Predict the label sequence based on the Conditional Random Field
### Aliases: predict.crf

### ** Examples

## Not run: 
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
##D              x = x[, grep("upos|lemma", colnames(x))], 
##D              group = x$doc_id, 
##D              method = "lbfgs", options = list(max_iterations = 5)) 
##D scores <- predict(model, 
##D                   newdata = x[, grep("upos|lemma", colnames(x))], 
##D                   group = x$doc_id, type = "marginal")
##D head(scores)
##D scores <- predict(model, 
##D                   newdata = x[, grep("upos|lemma", colnames(x))], 
##D                   group = x$doc_id, type = "sequence")
##D head(scores)
##D 
##D 
##D ## cleanup for CRAN
##D file.remove(model$file_model)
##D file.remove("modeldetails.txt")
##D file.remove(udmodel$file)
## End(Not run)



