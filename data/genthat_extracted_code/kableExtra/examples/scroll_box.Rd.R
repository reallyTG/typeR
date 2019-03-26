library(kableExtra)


### Name: scroll_box
### Title: Put a HTML table into a scrollable box
### Aliases: scroll_box

### ** Examples

## Not run: 
##D # Specify table size by pixels
##D kable(cbind(mtcars, mtcars), "html") %>%
##D     kable_styling() %>%
##D     scroll_box(width = "500px", height = "200px")
##D 
##D # Specify by percent
##D kable(cbind(mtcars, mtcars), "html") %>%
##D     kable_styling() %>%
##D     scroll_box(width = "100%", height = "200px")
## End(Not run)



