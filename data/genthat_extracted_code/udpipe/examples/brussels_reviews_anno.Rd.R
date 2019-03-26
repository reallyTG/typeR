library(udpipe)


### Name: brussels_reviews_anno
### Title: Reviews of the AirBnB customers which are tokenised, POS tagged
###   and lemmatised
### Aliases: brussels_reviews_anno

### ** Examples

## brussels_reviews_anno
data(brussels_reviews_anno)
head(brussels_reviews_anno)
sort(table(brussels_reviews_anno$xpos))

## Not run: 
##D 
##D ##
##D ## If you want to construct a similar dataset as the 
##D ## brussels_reviews_anno dataset based on the udpipe library, do as follows
##D ##
##D 
##D library(udpipe)
##D library(data.table)
##D data(brussels_reviews)
##D 
##D ## The brussels_reviews contains comments on Airbnb sites in 3 languages: es, fr and nl
##D table(brussels_reviews$language)
##D bxl_anno <- split(brussels_reviews, brussels_reviews$language)
##D 
##D ## Annotate the Spanish comments
##D m <- udpipe_download_model(language = "spanish-ancora")
##D m <- udpipe_load_model(file = m$file_model)
##D bxl_anno$es <- udpipe_annotate(object = m, x = bxl_anno$es$feedback, doc_id = bxl_anno$es$id)
##D 
##D ## Annotate the French comments
##D m <- udpipe_download_model(language = "french-partut")
##D m <- udpipe_load_model(file = m$file_model)
##D bxl_anno$fr <- udpipe_annotate(object = m, x = bxl_anno$fr$feedback, doc_id = bxl_anno$fr$id)
##D 
##D ## Annotate the Dutch comments
##D m <- udpipe_download_model(language = "dutch-lassysmall")
##D m <- udpipe_load_model(file = m$file_model)
##D bxl_anno$nl <- udpipe_annotate(object = m, x = bxl_anno$nl$feedback, doc_id = bxl_anno$nl$id)
##D 
##D brussels_reviews_anno <- lapply(bxl_anno, as.data.frame)
##D brussels_reviews_anno <- rbindlist(brussels_reviews_anno)
##D str(brussels_reviews_anno)
## End(Not run)



