library(rgoogleslides)


### Name: add_create_video_request
### Title: Add a create video request
### Aliases: add_create_video_request

### ** Examples

## Not run: 
##D library(rgoogleslides)
##D rgoogleslides::authorize()
##D 
##D # Define the presentation slide id (Can be retrieved from the url of the slides)
##D slides_id <- "<slide-id>"
##D 
##D # Define the youtube video id (Can be retrieved from the url of the youtube video)
##D youtube_id <- "<youtube-id>"
##D 
##D page_element <- aligned_page_element_property("p", align = "full")
##D request <- add_create_video_request(id = youtube_id, page_element_property = page_element)
##D commit_to_slides(slide_id, request)
## End(Not run)



