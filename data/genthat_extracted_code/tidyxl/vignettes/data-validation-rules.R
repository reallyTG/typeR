## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(tidyxl)
library(dplyr)
library(tidyr)
examples <- system.file("extdata/examples.xlsx", package = "tidyxl")
glimpse(xlsx_validation(examples)[1, ])

## ------------------------------------------------------------------------
as.data.frame(xlsx_validation(examples))

## ------------------------------------------------------------------------
rules <- xlsx_validation(examples)
cells <- filter(xlsx_cells(examples), row >= 106, col == 1)

rules
cells

inner_join(rules, cells, by = c("sheet" = "sheet", "ref" = "address"))

## ------------------------------------------------------------------------
unrange <- function(x) {
  limits <- cellranger::as.cell_limits(x)
  rows <- seq(limits$ul[1], limits$lr[1])
  cols <- seq(limits$ul[2], limits$lr[2])
  rowcol <- expand.grid(rows, cols)
  cell_addrs <- cellranger::cell_addr(rowcol[[1]], rowcol[[2]])
  cellranger::to_string(cell_addrs, fo = "A1", strict = FALSE)
}

unnest_ref <- function(x, ref) {
  UseMethod("unnest_ref")
}

unnest_ref.default <- function(x, ref_col = ref) {
  stopifnot(is.character(x), length(x) == 1L)
  refs <- unlist(strsplit(x, ",", fixed = TRUE))
  unlist(lapply(refs, unrange))
}

unrange("A121:A122")
unnest_ref("A115,A121:A122")

## ------------------------------------------------------------------------
unnest_ref.data.frame <- function(x, ref_col) {
  ref <- rlang::enquo(ref_col)
  x[[rlang::quo_name(ref)]] <- lapply(x[[rlang::quo_name(ref)]], unnest_ref)
  tidyr::unnest(x, rlang::UQ(ref))
}

(nested_rule <- slice(rules, 7))
unnest_ref(nested_rule, ref)

