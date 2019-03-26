library(textshape)


### Name: tidy_list
### Title: Tidy a List of Named Dataframes or Named Vectors or Vectors
### Aliases: tidy_list

### ** Examples

tidy_list(list(p=1:500, r=letters))
tidy_list(list(p=mtcars, r=mtcars, z=mtcars, d=mtcars))

x <- list(
    a = setNames(c(1:4), LETTERS[1:4]),
    b = setNames(c(7:9), LETTERS[7:9]),
    c = setNames(c(10:15), LETTERS[10:15]),
    d = c(x=4, y=6, 4),
    e = setNames(1:10, sample(state.abb, 10, TRUE)),
    f = setNames(1:10, sample(month.abb, 10, TRUE))
)

tidy_list(x)

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
##D     paste0("http://www.presidency.ucsb.edu/ws/index.php?pid=", x) %>%
##D         xml2::read_html() %>%
##D         rvest::html_nodes("p") %>%
##D         rvest::html_text() %>%
##D         textshape::split_index(grep("^[A-Z]+:", .)) %>%
##D         textshape::combine() %>%
##D         textshape::split_transcript() %>%
##D         textshape::split_sentence()
##D }) %>%
##D     textshape::tidy_list("location")
## End(Not run)



