#! /usr/bin/env R
library(dplyr)
library(readr)
library(fs)
library(purrr)

reader <- function(filepath) {
    cat(sprintf("Reading '%s'\n", filepath))
    read_csv(filepath,
             col_names = TRUE,
             col_types = cols(col_character(),
                              col_character(),
                              col_integer(),
                              col_integer(),
                              col_integer(),
                              col_character(),
                              col_integer()))
}


main <- function() {

    args <- commandArgs(trailingOnly=TRUE)

    if (length(args) < 2) {
        stop("Insufficient arguments, two expected")
    }

    input_dirpath <- args[1]
    output_filepath <- args[2]


    input_dirpath %>%
      dir_ls() %>%
      map_dfr(reader) %>%
      write_csv(output_filepath)
}


main()
