library(pdftools)


### Name: pdf_info
### Title: PDF utilities
### Aliases: pdf_info pdftools pdf_text pdf_data pdf_fonts pdf_attachments
###   pdf_toc pdf_pagesize

### ** Examples

# Just a random pdf file
pdf_file <- file.path(R.home("doc"), "NEWS.pdf")
info <- pdf_info(pdf_file)
text <- pdf_text(pdf_file)
fonts <- pdf_fonts(pdf_file)
files <- pdf_attachments(pdf_file)



