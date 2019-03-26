## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE, comment = "#>", message = FALSE, warning = FALSE, error = FALSE, tidy = TRUE
)
library(dplyr)

## ----read----------------------------------------------------------------
library(epubr)
file <- system.file("dracula.epub", package = "epubr")
(x <- epub(file))

x$data[[1]]

## ----metadata------------------------------------------------------------
epub_meta(file)

## ----fields--------------------------------------------------------------
epub(file, fields = c("title", "creator", "file"))

## ----drop_sections-------------------------------------------------------
epub(file, drop_sections = "cov")$data[[1]]

## ----chapters------------------------------------------------------------
x <- epub(file, drop_sections = "cov", chapter_pattern = "^item\\d\\d")
x

x$data[[1]]

## ----recombine1----------------------------------------------------------
pat <- "CHAPTER [IVX]+"
x2 <- epub_recombine(x, pat)
x2

x2$data[[1]]

## ----recombine2----------------------------------------------------------
library(dplyr)
x2 <- epub_recombine(x, pat) %>% epub_sift(n = 200)
x2

x2$data[[1]]

## ----recombine3----------------------------------------------------------
#epub_recombine(x, pat) %>% epub_sift(n = 200) %>% epub_recombine(pat)
x2 <- epub_recombine(x, pat, sift = list(n = 200))
x2

x2$data[[1]]

## ----reorder1------------------------------------------------------------
set.seed(1)
x2$data[[1]] <- sample_frac(x2$data[[1]]) # randomize rows for example
x2$data[[1]]

## ----reorder2------------------------------------------------------------
f <- function(x, pattern) as.numeric(as.roman(gsub(pattern, "\\1", x)))

## ----reorder3------------------------------------------------------------
x2 <- epub_reorder(x2, f, "^CHAPTER ([IVX]+).*")
x2$data[[1]]

## ----unzip---------------------------------------------------------------
bookdir <- file.path(tempdir(), "dracula")
epub_unzip(file, exdir = bookdir)
list.files(bookdir, recursive = TRUE)

## ----count_words---------------------------------------------------------
x <- " This   sentence will be counted to have:\n\n10 (ten) words."
count_words(x)

