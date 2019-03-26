library(pdfsearch)


### Name: heading_search
### Title: Function to locate sections of pdf
### Aliases: heading_search

### ** Examples

file <- system.file('pdf', '1501.00450.pdf', package = 'pdfsearch')

heading_search(file, headings = c('abstract', 'introduction'),
  path = TRUE)




