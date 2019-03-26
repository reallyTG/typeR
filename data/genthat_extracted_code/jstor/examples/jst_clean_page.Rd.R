library(jstor)


### Name: jst_clean_page
### Title: Clean a character vector of pages
### Aliases: jst_clean_page

### ** Examples

jst_clean_page("2")

# anything that is not a digit gets removed
jst_clean_page("A2-")

# a weird format from the American Journal of Sociology is convered correctly
jst_clean_page("AJSv104p126")
# this is done by searching for "p", and if it is found, extracting the
# content after "p".



