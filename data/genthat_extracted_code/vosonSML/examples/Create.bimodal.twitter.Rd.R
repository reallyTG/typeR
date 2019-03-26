library(vosonSML)


### Name: Create.bimodal.twitter
### Title: Create twitter bimodal network
### Aliases: Create.bimodal.twitter

### ** Examples

## Not run: 
##D # create a twitter bimodal network graph removing the hashtag '#auspol' as it was used in 
##D # the twitter search query
##D bimodalNetwork <- twitterData %>% 
##D                   Create("bimodal", removeTermsOrHashtags = c("#auspol"), writeToFile = TRUE, 
##D                          verbose = TRUE)
##D 
##D # igraph object
##D # bimodalNetwork$graph
## End(Not run)




