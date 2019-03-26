library(pdfsearch)


### Name: keyword_search
### Title: Search a pdf file for keywords
### Aliases: keyword_search

### ** Examples

file <- system.file('pdf', '1501.00450.pdf', package = 'pdfsearch')

keyword_search(file, keyword = c('repeated measures', 'mixed effects'),
  path = TRUE)
  
# Add surrounding text
keyword_search(file, keyword = c('variance', 'mixed effects'),
  path = TRUE, surround_lines = 1)
  
# split pdf
keyword_search(file, keyword = c('repeated measures', 'mixed effects'),
  path = TRUE, split_pdf = TRUE, remove_hyphen = FALSE)




