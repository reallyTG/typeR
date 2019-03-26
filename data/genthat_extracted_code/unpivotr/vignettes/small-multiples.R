## ---- out.width = "850px"------------------------------------------------
knitr::include_graphics("enron-screenshot.png")

## ------------------------------------------------------------------------
library(unpivotr)
library(tidyxl)
library(dplyr)
library(purrr)
library(tidyr)
library(stringr)

## ------------------------------------------------------------------------
path <- system.file("extdata/enron.xlsx", package = "unpivotr")

## ------------------------------------------------------------------------
cells <-
  xlsx_cells(path) %>%
  dplyr::filter(!is_blank, between(row, 14L, 56L), col <= 20) %>%
  select(row, col, data_type, numeric, character, date)

## ---- eval = FALSE-------------------------------------------------------
#  formatting <- xlsx_formats(path)

## ------------------------------------------------------------------------
title <-
  dplyr::filter(cells, character == "Fixed Price") %>%
  select(row, col) %>%
  mutate(row = row - 1L) %>%
  inner_join(cells, by = c("row", "col"))

## ------------------------------------------------------------------------
partitions <- partition(cells, title)

## ------------------------------------------------------------------------
partitions$cells[[1]] %>%
  behead("NNW", "title") %>%
  behead("NNW", "price") %>%
  behead("N", "bid_offer") %>%
  print(n = Inf)

## ------------------------------------------------------------------------
unpivoted <-
  purrr::map_dfr(partitions$cells,
                 ~ .x %>%
                   behead("NNW", "title") %>%
                   behead("NNW", "price") %>%
                   behead("N", "bid_offer")) %>%
  select(-data_type, -character, -date)
unpivoted

## ------------------------------------------------------------------------
row_headers <-
  cells %>%
  dplyr::filter(between(row, 17, 56), between(col, 2, 4)) %>%
  # Concatenate rows like "Dec-01", "to", "Mar-02"
  mutate(character = ifelse(!is.na(character),
                            character,
                            format(date, origin="1899-12-30", "%b-%y"))) %>%
  select(row, col, character) %>%
  nest(-row) %>%
  mutate(row_header = map(data,
                          ~ str_trim(paste(.x$character, collapse = " ")))) %>%
  unnest(row_header) %>%
  mutate(col = 2L) %>%
  select(row, row_header)
unpivoted <- left_join(unpivoted, row_headers, by = "row")
unpivoted

## ---- eval = FALSE-------------------------------------------------------
#  library(unpivotr)
#  library(tidyxl)
#  library(dplyr)
#  library(purrr)
#  library(tidyr)
#  library(stringr)
#  
#  cells <-
#    xlsx_cells(system.file("extdata/enron.xlsx", package = "unpivotr")) %>%
#    dplyr::filter(!is_blank, between(row, 14L, 56L), col <= 20) %>%
#    select(row, col, data_type, numeric, character, date)
#  
#  row_headers <-
#    dplyr::filter(cells, between(row, 17, 56), between(col, 2, 4)) %>%
#    mutate(character = ifelse(!is.na(character),
#                              character,
#                              format(date, origin="1899-12-30", "%b-%y"))) %>%
#    select(row, col, character) %>%
#    nest(-row) %>%
#    mutate(row_header = map(data,
#                            ~ str_trim(paste(.x$character, collapse = " ")))) %>%
#    unnest(row_header) %>%
#    mutate(col = 2L) %>%
#    select(row, row_header)
#  
#  titles <-
#    dplyr::filter(cells, character == "Fixed Price") %>%
#    select(row, col) %>%
#    mutate(row = row - 1L) %>%
#    inner_join(cells, by = c("row", "col"))
#  
#  partition(cells, titles)$cells %>%
#    purrr::map_dfr(~ .x %>%
#                   behead("NNW", "title") %>%
#                   behead("NNW", "price") %>%
#                   behead("N", "bid_offer")) %>%
#    select(-data_type, -character, -date) %>%
#    left_join(row_headers, by = "row")

