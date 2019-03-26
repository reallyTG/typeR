library(textshape)


### Name: bind_list
### Title: Row Bind a List of Named Dataframes or Vectors
### Aliases: bind_list

### ** Examples

## Not run: 
##D bind_list(list(p=1:500, r=letters))
##D bind_list(list(p=mtcars, r=mtcars, z=mtcars, d=mtcars))
##D 
##D ## 2015 Vice-Presidential Debates Example
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(rvest, magrittr, xml2)
##D 
##D debates <- c(
##D     wisconsin = "110908",
##D     boulder = "110906",
##D     california = "110756",
##D     ohio = "110489"
##D )
##D 
##D lapply(debates, function(x){
##D     xml2::read_html(paste0("http://www.presidency.ucsb.edu/ws/index.php?pid=", x)) %>%
##D         rvest::html_nodes("p") %>%
##D         rvest::html_text() %>%
##D         textshape::split_index(grep("^[A-Z]+:", .)) %>%
##D         textshape::combine() %>%
##D         textshape::split_transcript() %>%
##D         textshape::split_sentence()
##D }) %>%
##D     textshape::bind_list("location")
## End(Not run)



