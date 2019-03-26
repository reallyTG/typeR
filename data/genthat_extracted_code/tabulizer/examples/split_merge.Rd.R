library(tabulizer)


### Name: split_pdf
### Title: Split and merge PDFs
### Aliases: split_pdf merge_pdfs

### ** Examples

## No test: 
# simple demo file
f <- system.file("examples", "data.pdf", package = "tabulizer")
get_n_pages(file = f)

# split PDF by page
sf <- split_pdf(f)

# merge pdf
mf <- file.path(tempdir(), "merged.pdf")
merge_pdfs(sf, mf)
get_n_pages(mf)
## End(No test)



