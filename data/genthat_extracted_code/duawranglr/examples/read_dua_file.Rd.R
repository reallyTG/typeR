library(duawranglr)


### Name: read_dua_file
### Title: Read in raw data file
### Aliases: read_dua_file

### ** Examples

## --------------
## Setup
## --------------
## set DUA crosswalk
dua_cw <- system.file('extdata', 'dua_cw.csv', package = 'duawranglr')
set_dua_cw(dua_cw)
## --------------

## read in data
file <- system.file('extdata', 'admin_data.csv', package = 'duawranglr')
df <- read_dua_file(file)

## show
df

## Not run: 
##D ## read in other file types
##D read_dua_file('admin_data.rds')
##D read_dua_file('admin_data.txt', sep = '|')
##D read_dua_file('admin_data.dta')
##D read_dua_file('admin_data.xlsx', sheet = 2)
## End(Not run)




