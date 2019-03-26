library(kableExtra)


### Name: add_header_above
### Title: Add a header row on top of current header
### Aliases: add_header_above

### ** Examples

x <- knitr::kable(head(mtcars), "html")
# Add a row of header with 3 columns on the top of the table. The column
# span for the 2nd and 3rd one are 5 & 6.
add_header_above(x, c(" ", "Group 1" = 5, "Group 2" = 6))




