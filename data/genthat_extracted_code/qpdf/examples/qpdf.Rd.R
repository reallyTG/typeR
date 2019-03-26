library(qpdf)


### Name: qpdf
### Title: Split, Combine and Compress PDF Files
### Aliases: qpdf pdf_split pdf_length pdf_subset pdf_combine pdf_compress

### ** Examples

# extract some pages
pdf_file <- file.path(tempdir(), "output.pdf")
pdf_subset('https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf',
  pages = 1:3, output = pdf_file)
pdf_length(pdf_file)
unlink(pdf_file)



