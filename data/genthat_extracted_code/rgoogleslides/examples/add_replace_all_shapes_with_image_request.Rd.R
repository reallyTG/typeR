library(rgoogleslides)


### Name: add_replace_all_shapes_with_image_request
### Title: Add a replace all shapes with image request
### Aliases: add_replace_all_shapes_with_image_request

### ** Examples

## Not run: 
##D library(rgoogleslides)
##D rgoogleslides::authorize()
##D 
##D # Define the presentation slide id (Can be retrieved from the url of the slides)
##D slides_id <- "<slide-id>"
##D 
##D # Define the internal drive image file to be inserted into slides
##D file_id <- "<file_id>"
##D 
##D request <- add_replace_all_shapes_with_image_request(image_url = file_id, text = 'aaa')
##D commit_to_slides(slides_id, request)
## End(Not run)



