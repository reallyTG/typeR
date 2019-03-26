library(duawranglr)


### Name: deid_dua
### Title: Convert identifying variable to unique hash
### Aliases: deid_dua

### ** Examples

## --------------
## Setup
## --------------
## set DUA crosswalk
dua_cw <- system.file('extdata', 'dua_cw.csv', package = 'duawranglr')
set_dua_cw(dua_cw)
## read in data
admin <- system.file('extdata', 'admin_data.csv', package = 'duawranglr')
df <- read_dua_file(admin)
## --------------

## show identified data
df

## deidentify
df <- deid_dua(df, id_col = 'sid', new_id_name = 'id', id_length = 12)

## show deidentified data
df

## Not run: 
##D ## save crosswalk between old and new ids for future
##D deid_dua(df, write_crosswalk = TRUE)
##D 
##D ## use existing crosswalk (good for panel datasets that need link)
##D deid_dua(df, existing_crosswalk = './crosswalk/master_crosswalk.csv')
## End(Not run)




