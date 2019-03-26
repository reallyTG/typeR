library(textshape)


### Name: split_transcript
### Title: Split a Transcript Style Vector on Delimiter & Coerce to
###   Dataframe
### Aliases: split_transcript

### ** Examples

split_transcript(c("greg: Who me", "sarah: yes you!"))

## Not run: 
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
##D })
## End(Not run)



