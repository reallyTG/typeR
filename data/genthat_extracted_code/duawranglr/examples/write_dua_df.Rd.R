library(duawranglr)


### Name: write_dua_df
### Title: Write DUA approved data set
### Aliases: write_dua_df

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
## set restriction level
set_dua_level('level_iii')
## remove restrictive variables
df <- dplyr::select(df, -c(sid,sname,tname))
## --------------

## check restrictions
check_dua_restrictions(df)

## able to write since restrictions check passed
file <- file.path(tempdir(), 'clean_data.csv')
write_dua_df(df, file_name = file, output_type = 'csv')

## Not run: 
##D  write_dua_df(df, 'clean_data', output_type = 'delimited', sep = '|')
##D  write_dua_df(df, 'clean_data', output_type = 'stata', version = 11)
## End(Not run)




