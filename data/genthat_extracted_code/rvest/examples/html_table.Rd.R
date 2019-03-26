library(rvest)


### Name: html_table
### Title: Parse an html table into a data frame.
### Aliases: html_table

### ** Examples

tdist <- read_html("http://en.wikipedia.org/wiki/Student%27s_t-distribution")
tdist %>%
  html_node("table.infobox") %>%
  html_table(header = FALSE)

births <- read_html("https://www.ssa.gov/oact/babynames/numberUSbirths.html")
html_table(html_nodes(births, "table")[[2]])

# If the table is badly formed, and has different number of rows in
# each column use fill = TRUE. Here's it's due to incorrect colspan
# specification.
skiing <- read_html("http://data.fis-ski.com/dynamic/results.html?sector=CC&raceid=22395")
skiing %>%
  html_table(fill = TRUE)



