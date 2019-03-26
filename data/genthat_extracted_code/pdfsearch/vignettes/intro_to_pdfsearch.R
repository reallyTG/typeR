## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----search1, message = FALSE--------------------------------------------
library(pdfsearch)
file <- system.file('pdf', '1610.00147.pdf', package = 'pdfsearch')

result <- keyword_search(file, 
            keyword = c('measurement', 'error'),
            path = TRUE)
head(result)
head(result$line_text, n = 2)

## ----surround------------------------------------------------------------
file <- system.file('pdf', '1610.00147.pdf', package = 'pdfsearch')

result <- keyword_search(file, 
            keyword = c('measurement', 'error'),
            path = TRUE, surround_lines = 1)
head(result)
head(result$line_text, n = 2)

## ----remove_hyphen-------------------------------------------------------
file <- system.file('pdf', '1610.00147.pdf', package = 'pdfsearch')

result_hyphen <- keyword_search(file, 
            keyword = c('measurement'),
            path = TRUE, remove_hyphen = FALSE)

result_remove_hyphen <- keyword_search(file, 
            keyword = c('measurement'),
            path = TRUE, remove_hyphen = TRUE)

nrow(result_hyphen)
nrow(result_remove_hyphen)

## ----convert_tokens_text-------------------------------------------------
token_result <- convert_tokens(file, path = TRUE)[[1]]
head(token_result)

## ----convert_tokens_result-----------------------------------------------
file <- system.file('pdf', '1501.00450.pdf', package = 'pdfsearch')

result <- keyword_search(file, 
            keyword = c('repeated measures', 'mixed effects'),
            path = TRUE, surround_lines = 1)
result

## ----directory-----------------------------------------------------------
directory <- system.file('pdf', package = 'pdfsearch')

result <- keyword_directory(directory,
                           keyword = c('repeated measures', 'mixed effects',
                                       'error'),
                           surround_lines = 1, full_names = TRUE)
head(result)

## ----shiny, eval = FALSE-------------------------------------------------
#  run_shiny()

