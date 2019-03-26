library(rgoogleslides)


### Name: add_create_shape_request
### Title: Add a create shape request
### Aliases: add_create_shape_request

### ** Examples

## Not run: 
##D library(rgoogleslides)
##D rgoogleslides::authorize()
##D 
##D # Define the presentation slide id (Can be retrieved from the url of the slides)
##D slides_id <- "<slide-id>"
##D 
##D slide_page <- page_element_property("p", 200, 300)
##D request <- add_create_shape_request(shape_type = "RECTANGLE", page_element_property = slide_page)
##D commit_to_slides(slides_id, request)
##D 
##D slide_page <- aligned_page_element_property("p", image_height = 200, image_width = 300)
##D request2 <- add_create_shape_request(shape_type = "STAR_5", page_element_property = slide_page)
##D commit_to_slides(slides_id, request2)
## End(Not run)



