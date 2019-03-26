## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
suppressPackageStartupMessages(library(DiagrammeR))

## ----prisma--------------------------------------------------------------
#install.packages("PRISMAstatement")
library(PRISMAstatement)

prisma(found = 750,
       found_other = 123,
       no_dupes = 776, 
       screened = 776, 
       screen_exclusions = 13, 
       full_text = 763,
       full_text_exclusions = 17, 
       qualitative = 746, 
       quantitative = 319,
       width = 800, height = 800)

## ----prismadupesbox------------------------------------------------------
prisma(found = 750,
       found_other = 123,
       no_dupes = 776, 
       screened = 776, 
       screen_exclusions = 13, 
       full_text = 763,
       full_text_exclusions = 17, 
       qualitative = 746, 
       quantitative = 319,
       extra_dupes_box = TRUE)

## ----labels--------------------------------------------------------------
prisma(1000, 20, 270, 270, 10, 260, 20, 240, 107,
       labels = list(found = "FOUND", found_other = "OTHER"))

## ----errors and warnings-------------------------------------------------
tryCatch(
  prisma(1, 2, 3, 4, 5, 6, 7, 8, 9),
  error = function(e) e$message)
prisma(1000, 20, 270, 270, 10, 260, 19, 240, 107, 
       width = 100, height = 100)
prisma(1000, 20, 270, 270, 269, 260, 20, 240, 107, 
       width = 100, height = 100)

## ----prismadpi1, fig.cap="just set width and height"---------------------
prisma(found = 750,
       found_other = 123,
       no_dupes = 776, 
       screened = 776, 
       screen_exclusions = 13, 
       full_text = 763,
       full_text_exclusions = 17, 
       qualitative = 746, 
       quantitative = 319,
       width = 200, height = 200)

## ----prismadpi2, fig.cap="same width and height but DPI increased to 300"----
prisma(found = 750,
       found_other = 123,
       no_dupes = 776, 
       screened = 776, 
       screen_exclusions = 13, 
       full_text = 763,
       full_text_exclusions = 17, 
       qualitative = 746, 
       quantitative = 319,
       width = 200, height = 200,
       dpi = 300)

## ----prismadpi3, fig.cap="same width and height but DPI decreased to 36"----
prisma(found = 750,
       found_other = 123,
       no_dupes = 776, 
       screened = 776, 
       screen_exclusions = 13, 
       full_text = 763,
       full_text_exclusions = 17, 
       qualitative = 746, 
       quantitative = 319,
       width = 200, height = 200,
       dpi = 36)

## ----prismapdf, echo = TRUE, eval = FALSE--------------------------------
#  prsm <- prisma(found = 750,
#                 found_other = 123,
#                 no_dupes = 776,
#                 screened = 776,
#                 screen_exclusions = 13,
#                 full_text = 763,
#                 full_text_exclusions = 17,
#                 qualitative = 746,
#                 quantitative = 319,
#                 width = 200, height = 200,
#                 dpi = 36)
#  tmp_pdf <- tempfile()
#  PRISMAstatement:::prisma_pdf(prsm, tmp_pdf)
#  knitr::include_graphics(path = tmp_pdf)
#  unlink(tmp_pdf)

