library(vcr)


### Name: HTTPInteractionList
### Title: HTTPInteractionList class
### Aliases: HTTPInteractionList
### Keywords: datasets

### ** Examples

## Not run: 
##D vcr_configure(
##D  dir = tempdir(),
##D  record = "once"
##D )
##D 
##D # make interactions
##D ## make the request
##D ### turn off mocking
##D crul::mock(FALSE)
##D url <- "https://eu.httpbin.org/post"
##D cli <- crul::HttpClient$new(url = url)
##D res <- cli$post(body = list(a = 5))
##D 
##D ## request
##D (request <- Request$new("POST", url, body, res$headers))
##D ## response
##D (response <- VcrResponse$new(
##D    res$status_http(),
##D    res$response_headers,
##D    res$parse("UTF-8"),
##D    res$response_headers$status))
##D ## make an interaction
##D (inter <- HTTPInteraction$new(request = request, response = response))
##D 
##D # make an interactionlist
##D (x <- HTTPInteractionList$new(
##D    interactions = list(inter),
##D    request_matchers = vcr_configuration()$match_requests_on
##D ))
##D x$interactions
##D x$request_matchers
##D x$parent_list
##D x$parent_list$response_for()
##D x$parent_list$has_interaction_matching()
##D x$parent_list$has_used_interaction_matching()
##D x$parent_list$remaining_unused_interaction_count()
##D x$used_interactions
##D x$allow_playback_repeats
##D x$interactions
##D x$response_for(request)
## End(Not run)



