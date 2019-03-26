library(svMisc)


### Name: about
### Title: Get information and help about R objects
### Aliases: about ?
### Keywords: utilities

### ** Examples

about("nonexisting") # Not found on search path, but help pages
about("htgdsfgfdsgf") # Not found anywhere
#library(tidyverse)
#about("group_by") # Just one page
#about("filter") # Several items
about("stats::filter") # OK
#about("dplyr::filter") # OK too
about("base::filter") # Not found there
# Objects with comment: print comment
vec <- structure(1:10, comment = "A simple vector")
about("vec")
# If there is a srcfile attribute in the comment, also display the file
# Hint: integrate some help in the header!
#library(data)
#(iris <- read(data_example("iris.csv")))
#about("iris")
# If the comment has a src attribute, change the topic to that one
#urchin <- read("urchin_bio", package = "data")
#about("urchin")
.?filter
.?stats::filter



