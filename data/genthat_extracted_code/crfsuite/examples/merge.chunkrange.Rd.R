library(crfsuite)


### Name: merge.chunkrange
### Title: CRF Training data construction: add chunk entity category to a
###   tokenised dataset
### Aliases: merge.chunkrange

### ** Examples

## Not run: 
##D library(udpipe)
##D udmodel <- udpipe_download_model("dutch-lassysmall")
##D if(packageVersion("udpipe") >= "0.7"){
##D   data(airbnb_chunks, package = "crfsuite")
##D   airbnb_chunks <- head(airbnb_chunks, 20)
##D   airbnb_tokens <- unique(airbnb_chunks[, c("doc_id", "text")])
##D 
##D   airbnb_tokens <- udpipe(airbnb, object = udmodel)
##D   head(airbnb_tokens)
##D   head(airbnb_chunks)
##D 
##D   ## Add the entity of the chunk to the tokenised dataset
##D   x <- merge(airbnb_chunks, airbnb_tokens)
##D   table(x$chunk_entity)
##D }
##D 
##D ## cleanup for CRAN
##D file.remove(udmodel$file_model)
## End(Not run)



