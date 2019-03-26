library(udpipe)


### Name: cbind_morphological
### Title: Add morphological features to an annotated dataset
### Aliases: cbind_morphological

### ** Examples

## Not run: 
##D udmodel <- udpipe_download_model(language = "english-ewt")
##D udmodel <- udpipe_load_model(file = udmodel$file_model)
##D x <- udpipe_annotate(udmodel, 
##D                      x = "The economy is weak but the outlook is bright")
##D x <- as.data.frame(x)
##D x <- cbind_morphological(x, term = "feats")
## End(Not run)

f <- system.file(package = "udpipe", "dummydata", "traindata.conllu")
x <- udpipe_read_conllu(f)
x <- cbind_morphological(x, term = "feats")



