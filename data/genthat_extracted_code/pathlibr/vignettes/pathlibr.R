## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(pathlibr)
library(glue)

## ------------------------------------------------------------------------
root <- Path$new(system.file("", package = "pathlibr", mustWork = TRUE))

## ------------------------------------------------------------------------
root$show

## ------------------------------------------------------------------------
eg <- root$dir$example
print(glue("using dir: {eg$show}"))

eg <- root$.$example

print(glue("using '.': {eg$show}"))

## ------------------------------------------------------------------------
file <- eg$.$path$.$to$.$file1.txt

file

## ------------------------------------------------------------------------
file$parent

file$..

## ------------------------------------------------------------------------
file2 <- file$..$.$file2.txt

file2$show

## ------------------------------------------------------------------------
directory <- file$..

for (f in c("file1.txt", "file2.txt")){
  print(glue("{f}:\n"))
  
  directory$.[[f]]$show %>% readLines() %>% cat()
  
  print(glue("\n"))
}


