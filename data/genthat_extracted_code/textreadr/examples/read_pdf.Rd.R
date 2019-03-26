library(textreadr)


### Name: read_pdf
### Title: Read a Portable Document Format into R
### Aliases: read_pdf
### Keywords: pdf

### ** Examples

pdf_dat <- read_pdf(
    system.file("docs/rl10075oralhistoryst002.pdf", package = "textreadr")
)

pdf_dat_b <- read_pdf(
    system.file("docs/rl10075oralhistoryst002.pdf", package = "textreadr"),
    skip = 1
)

## Not run: 
##D library(textshape)
##D system.file("docs/rl10075oralhistoryst002.pdf", package = "textreadr") %>%
##D     read_pdf(1) %>%
##D     `[[`('text') %>%
##D     head(-1) %>%
##D     textshape::combine() %>%
##D     gsub("([A-Z])( )([A-Z])", "\\1_\\3", .) %>%
##D     strsplit("(-| )(?=[A-Z_]+:)", perl=TRUE) %>%
##D     `[[`(1) %>%
##D     textshape::split_transcript()
## End(Not run)

## Not run: 
##D ## An image based .pdf file returns nothing.  Using the tesseract package as
##D ## a backend for OCR overcomes this problem.
##D 
##D ## Non-ocr
##D read_pdf(
##D     system.file("docs/McCune2002Choi2010.pdf", package = "textreadr"),
##D     ocr = FALSE
##D )
##D 
##D read_pdf(
##D     system.file("docs/McCune2002Choi2010.pdf", package = "textreadr"),
##D     ocr = TRUE
##D )
## End(Not run)



