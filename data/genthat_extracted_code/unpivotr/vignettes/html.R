## ---- echo = TRUE--------------------------------------------------------
library(dplyr)
library(rvest)
library(htmltools)
library(unpivotr)

## ---- echo = TRUE--------------------------------------------------------
rowspan <- system.file("extdata", "rowspan.html", package = "unpivotr")
includeHTML(rowspan)

# rvest
rowspan %>%
  read_html() %>%
  html_table()

# unpivotr
rowspan %>%
  read_html() %>%
  as_cells()

## ---- echo = TRUE--------------------------------------------------------
colspan <- system.file("extdata", "colspan.html", package = "unpivotr")
includeHTML(colspan)

# rvest
colspan %>%
  read_html() %>%
  html_table()

# unpivotr
colspan %>%
  read_html() %>%
  as_cells()

## ---- echo = TRUE--------------------------------------------------------
rowandcolspan <- system.file("extdata",
                             "row-and-colspan.html",
                             package = "unpivotr")
includeHTML(rowandcolspan)

# rvest
rowandcolspan %>%
  read_html() %>%
  html_table()

# unpivotr
rowandcolspan %>%
  read_html() %>%
  as_cells()

## ---- echo = TRUE--------------------------------------------------------
nested <- system.file("extdata", "nested.html", package = "unpivotr")
includeHTML(nested)

# rvest parses both tables
nested %>%
  read_html() %>%
  html_table(fill = TRUE)

# unpivotr
x <-
  nested %>%
  read_html() %>%
  as_cells() %>%
  .[[1]]
x

# The html of the table inside a cell
cell <-
  x %>%
  dplyr::filter(row == 2, col == 2) %>%
  .$html
cell

# Parsing the table inside the cell
cell %>%
  read_html() %>%
  as_cells()

## ---- echo = TRUE--------------------------------------------------------
urls <- system.file("extdata", "url.html", package = "unpivotr")
includeHTML(urls)

cell_url <- function(x) {
  if (is.na(x)) return(NA)
  x %>%
    read_html %>%
    html_nodes("a") %>%
    html_attr("href")
}

cell_text <- function(x) {
  if (is.na(x)) return(NA)
  x %>%
    read_html %>%
    html_nodes("a") %>%
    html_text()
}

urls %>%
  read_html() %>%
  as_cells() %>%
  .[[1]] %>%
  mutate(text = purrr::map(html, cell_text),
         url = purrr::map(html, cell_url)) %>%
  tidyr::unnest(text, url)

