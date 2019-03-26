library(gofastr)


### Name: as_dtm
### Title: Coerce Various Object Into a
###   'DocumentTermMatrix'/'TermDocumentMatrix'
### Aliases: as_dtm as_tdm
### Keywords: documenttermmatrix, termdocumentmatrix

### ** Examples

with(partial_republican_debates_2015,
    as_dtm(dialogue, paste(location, element_id, sentence_id, sep = "_"))
)

as_dtm(mtcars)
as_dtm(CO2, docs = c('Plant', 'Type', 'Treatment'))
## Not run: 
##D ## termco object to DTM/TDM
##D library(termco)
##D as_dtm(markers)
##D as_dtm(markers,weighting = tm::weightTfIdf)
##D as_tdm(markers)
##D 
##D cosine_distance <- function (x, ...) {
##D     x <- t(slam::as.simple_triplet_matrix(x))
##D     stats::as.dist(1 - slam::crossprod_simple_triplet_matrix(x)/(sqrt(slam::col_sums(x^2) %*%
##D         t(slam::col_sums(x^2)))))
##D }
##D 
##D 
##D mod <- hclust(cosine_distance(as_dtm(markers)))
##D plot(mod)
##D rect.hclust(mod, k = 5, border = "red")
##D 
##D (clusters <- cutree(mod, 5))
##D 
##D ## Parts of speech to DTM/TDM
##D library(tagger)
##D library(dplyr)
##D data(presidential_debates_2012_pos)
##D 
##D pos <- presidential_debates_2012_pos %>%
##D     select_tags(c("NN", "NNP", "NNPS", "NNS"))
##D 
##D as_dtm(pos_text)
##D as_dtm(pos_text, pos=FALSE)
##D 
##D as_tdm(pos_text)
##D as_tdm(pos_text, pos=FALSE)
##D 
##D presidential_debates_2012_pos %>%
##D     as_basic() %>%
##D     as_dtm()
## End(Not run)



