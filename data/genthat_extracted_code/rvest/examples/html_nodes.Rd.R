library(rvest)


### Name: html_nodes
### Title: Select nodes from an HTML document
### Aliases: html_node html_nodes

### ** Examples

# CSS selectors ----------------------------------------------
ateam <- read_html("http://www.boxofficemojo.com/movies/?id=ateam.htm")
html_nodes(ateam, "center")
html_nodes(ateam, "center font")
html_nodes(ateam, "center font b")

# But html_node is best used in conjunction with %>% from magrittr
# You can chain subsetting:
ateam %>% html_nodes("center") %>% html_nodes("td")
ateam %>% html_nodes("center") %>% html_nodes("font")

td <- ateam %>% html_nodes("center") %>% html_nodes("td")
td
# When applied to a list of nodes, html_nodes() returns all nodes,
# collapsing results into a new nodelist.
td %>% html_nodes("font")
# html_node() returns the first matching node. If there are no matching
# nodes, it returns a "missing" node
if (utils::packageVersion("xml2") > "0.1.2") {
  td %>% html_node("font")
}

# To pick out an element at specified position, use magrittr::extract2
# which is an alias for [[
library(magrittr)
ateam %>% html_nodes("table") %>% extract2(1) %>% html_nodes("img")
ateam %>% html_nodes("table") %>% `[[`(1) %>% html_nodes("img")

# Find all images contained in the first two tables
ateam %>% html_nodes("table") %>% `[`(1:2) %>% html_nodes("img")
ateam %>% html_nodes("table") %>% extract(1:2) %>% html_nodes("img")

# XPath selectors ---------------------------------------------
# chaining with XPath is a little trickier - you may need to vary
# the prefix you're using - // always selects from the root noot
# regardless of where you currently are in the doc
ateam %>%
  html_nodes(xpath = "//center//font//b") %>%
  html_nodes(xpath = "//b")



