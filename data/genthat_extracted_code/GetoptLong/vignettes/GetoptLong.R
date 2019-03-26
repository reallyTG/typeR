## ---- echo = FALSE, message = FALSE---------------------------------------------------------------
library(markdown)
options(markdown.HTML.options = c(options('markdown.HTML.options')[[1]], "toc"))

library(knitr)
knitr::opts_chunk$set(
    error = FALSE,
    tidy  = FALSE,
    message = FALSE,
    fig.align = "center")
options(markdown.HTML.stylesheet = "custom.css")

options(width = 100)

## ---- eval = FALSE--------------------------------------------------------------------------------
#  library(GetoptLong)
#  
#  cutoff = 0.05
#  GetoptLong(
#      "number=i", "Number of items, integer, mandatory option",
#      "cutoff=f", "cutoff to filter results, optional, default (0.05)",
#      "verbose",  "print messages"
#  )

## ---- eval = FALSE--------------------------------------------------------------------------------
#  VERSION = "0.0.1"
#  GetoptLong(
#  	"tag=i", "this is a description of tag which is long long and very long and extremly long...",
#  	head = 'An example to show how to use the packages',
#  	foot = 'Please contact author@gmail.com for comments'
#  )

## ---- eval = FALSE--------------------------------------------------------------------------------
#  GetoptLong.options("config" = "bundling")
#  GetoptLong.options("config" = c("no_ignore_case", "bundling"))

## ---- eval = FALSE--------------------------------------------------------------------------------
#  GetoptLong:::source("foo.R", argv = "--cutoff 0.01 --input file=foo.txt --verbose")

## -------------------------------------------------------------------------------------------------
sessionInfo()

