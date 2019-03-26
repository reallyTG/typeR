library(duawranglr)


### Name: make_dua_template
### Title: Interactive function to create template file
### Aliases: make_dua_template

### ** Examples

## Not run: 
##D ## run interactively
##D make_dua_template('data_clean.R')
##D 
##D ## ...and don't include extra notes
##D make_dua_template('data_clean.R', include_notes = FALSE)
## End(Not run)

## make template to be filled in
file <- file.path(tempdir(), 'data_clean.R')
make_dua_template(file, answer_list = list('No','','No','',''))

## show
writeLines(readLines(file))




