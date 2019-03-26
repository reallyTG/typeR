library(xpose)


### Name: get_file
### Title: Access model output file data
### Aliases: get_file

### ** Examples

# Single file (returns a tibble)
ext_file <- get_file(xpdb_ex_pk, file = 'run001.ext')
ext_file

# Multiple files (returns a list)
files <- get_file(xpdb_ex_pk, file = c('run001.ext', 'run001.phi'))
files

# Tip to list available files in the xpdb
print(xpdb_ex_pk)




