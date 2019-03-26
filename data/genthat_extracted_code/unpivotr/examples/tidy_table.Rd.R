library(unpivotr)


### Name: tidy_table
### Title: Tokenize data frames into a tidy 'melted' structure
### Aliases: tidy_table

### ** Examples

x <- data.frame(a = c(10, 20),
                b = c("foo", "bar"),
                stringsAsFactors = FALSE)
x
tidy_table(x)
tidy_table(x, row_names = TRUE)
tidy_table(x, col_names = TRUE)

# 'list' columns are undisturbed
y <- data.frame(a = c("a", "b"), stringsAsFactors = FALSE)
y$b <- list(1:2, 3:4)
y
tidy_table(y)

# Factors are preserved by being wrapped in lists so that their levels don't
# conflict.  Blanks are NULLs.
z <- data.frame(x = factor(c("a", "b")),
                y = factor(c("c", "d"), ordered = TRUE))
tidy_table(z)
tidy_table(z)$fct
tidy_table(z)$ord

# HTML tables can be extracted from the output of xml2::read_html().  These
# are returned as a list of tables, similar to rvest::html_table().  The
# value of each cell is its standalone HTML string, which can contain
# anything -- even another table.

colspan <- system.file("extdata", "colspan.html", package = "unpivotr")
rowspan <- system.file("extdata", "rowspan.html", package = "unpivotr")
nested <- system.file("extdata", "nested.html", package = "unpivotr")

## Not run: 
##D browseURL(colspan)
##D browseURL(rowspan)
##D browseURL(nestedspan)
## End(Not run)

tidy_table(xml2::read_html(colspan))
tidy_table(xml2::read_html(rowspan))
tidy_table(xml2::read_html(nested))



