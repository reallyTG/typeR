library(udpipe)


### Name: cbind_dependencies
### Title: Add the dependency parsing information to an annotated dataset
### Aliases: cbind_dependencies

### ** Examples

## Not run: 
##D udmodel <- udpipe_download_model(language = "english-ewt")
##D udmodel <- udpipe_load_model(file = udmodel$file_model)
##D x <- udpipe_annotate(udmodel, 
##D                      x = "The economy is weak but the outlook is bright")
##D x <- as.data.frame(x)
##D x[, c("token_id", "token", "head_token_id", "dep_rel")]
##D x <- cbind_dependencies(x, type = "parent")
##D nominalsubject <- subset(x, dep_rel %in% c("nsubj"))
##D nominalsubject <- nominalsubject[, c("dep_rel", "token", "token_parent")]
##D nominalsubject
## End(Not run)



