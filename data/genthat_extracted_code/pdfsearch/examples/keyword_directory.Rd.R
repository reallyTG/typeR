library(pdfsearch)


### Name: keyword_directory
### Title: Wrapper for keyword search function
### Aliases: keyword_directory

### ** Examples

# find directory
directory <- system.file('pdf', package = 'pdfsearch')

# do search over two files
keyword_directory(directory, 
       keyword = c('repeated measures', 'measurement error'),
       surround_lines = 1, full_names = TRUE)
       
# can also split pdfs
keyword_directory(directory, 
       keyword = c('repeated measures', 'measurement error'),
       split_pdf = TRUE, remove_hyphen = FALSE,
       surround_lines = 1, full_names = TRUE)





