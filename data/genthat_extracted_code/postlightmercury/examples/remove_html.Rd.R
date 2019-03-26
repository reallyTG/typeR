library(postlightmercury)


### Name: remove_html
### Title: Removes html
### Aliases: remove_html

### ** Examples

## Not run: 
##D # First get api key here: https://mercury.postlight.com/web-parser/
##D 
##D # Then run the code below replacing the X's wih your api key.
##D url <- "https://trackchanges.postlight.com/building-awesome-cms-f034344d8ed"
##D my_data <- web_parser(page_urls = url,
##D                       api_key = XXXXXXXXXXXXXXXXXXXXXXX)
##D 
##D # With html formatting:
##D my_data$content
##D 
##D # Now remove it:
##D my_data$content <- remove_html(my_data$content)
##D 
##D # Without html formatting:
##D my_data$content
## End(Not run)



