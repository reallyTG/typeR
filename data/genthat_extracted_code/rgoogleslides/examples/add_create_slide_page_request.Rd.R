library(rgoogleslides)


### Name: add_create_slide_page_request
### Title: Add a create slide request
### Aliases: add_create_slide_page_request

### ** Examples

## Not run: 
##D library(rgoogleslides)
##D rgoogleslides::authorize()
##D 
##D # Define the presentation slide id (Can be retrieved from the url of the slides)
##D slides_id <- "<slide-id>"
##D 
##D requests <- add_create_slide_page_request()
##D commit_to_slides(slides_id, requests)
##D 
##D requests2 <- add_create_slide_page_request(predefined_layout = "TITLE")
##D commit_to_slides(slides_id, requests2)
## End(Not run)



