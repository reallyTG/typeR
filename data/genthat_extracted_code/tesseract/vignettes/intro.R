## ---- echo = FALSE, message = FALSE---------------------------------------------------------------
library(tibble)
knitr::opts_chunk$set(comment = "")
options(width = 100, max.print = 100)
has_nld <- "nld" %in% tesseract::tesseract_info()$available

## -------------------------------------------------------------------------------------------------
library(tesseract)
eng <- tesseract("eng")
text <- tesseract::ocr("http://jeroen.github.io/images/testocr.png", engine = eng)
cat(text)

## -------------------------------------------------------------------------------------------------
results <- tesseract::ocr_data("http://jeroen.github.io/images/testocr.png", engine = eng)
results

## -------------------------------------------------------------------------------------------------
tesseract_info()

## ---- eval=FALSE----------------------------------------------------------------------------------
#  # Only need to do download once:
#  tesseract_download("nld")

## ----eval = has_nld-------------------------------------------------------------------------------
# Now load the dictionary
(dutch <- tesseract("nld"))
text <- ocr("https://jeroen.github.io/images/utrecht2.png", engine = dutch)
cat(text)

## -------------------------------------------------------------------------------------------------
library(magick)
input <- image_read("https://jeroen.github.io/images/bowers.jpg")

text <- input %>%
  image_resize("2000x") %>%
  image_convert(type = 'Grayscale') %>%
  image_trim(fuzz = 40) %>%
  image_write(format = 'png', density = '300x300') %>%
  tesseract::ocr() 

cat(text)

## ---- eval=require(pdftools)----------------------------------------------------------------------
pngfile <- pdftools::pdf_convert('https://jeroen.github.io/images/ocrscan.pdf', dpi = 600)
text <- tesseract::ocr(pngfile)
cat(text)

## -------------------------------------------------------------------------------------------------
# List all parameters with *colour* in name or description
tesseract_params('colour')

