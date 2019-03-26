library(vosonSML)


### Name: Create.semantic.twitter
### Title: Create twitter semantic network
### Aliases: Create.semantic.twitter

### ** Examples

## Not run: 
##D # create a twitter semantic network graph removing the hashtag '#auspol' and using the
##D # top 2% frequently occurring terms and 10% frequently occurring hashtags as additional 
##D # concepts or nodes
##D semanticNetwork <- twitterData %>% 
##D                    Create("semantic", removeTermsOrHashtags = c("#auspol"), termFreq = 2,
##D                           hashtagFreq = 10, writeToFile = TRUE, verbose = TRUE)
##D 
##D # igraph object
##D # semanticNetwork$graph
## End(Not run)




