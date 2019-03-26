library(duawranglr)


### Name: check_dua_restrictions
### Title: Check data frame columns against currently set restrictions
### Aliases: check_dua_restrictions

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

## set restriction level
set_dua_level('level_iii')

## show restrictions
see_dua_level(show_restrictions = TRUE)

## see variables in administrative data file
names(df)

## remove restrictive variables
df <- dplyr::select(df, -c(sid,sname,tname))

## confirm
check_dua_restrictions(df)




