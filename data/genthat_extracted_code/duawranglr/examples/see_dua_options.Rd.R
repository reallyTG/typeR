library(duawranglr)


### Name: see_dua_options
### Title: Show DUA crosswalk options
### Aliases: see_dua_options

### ** Examples

## --------------
## Setup
## --------------
## set DUA crosswalk
dua_cw <- system.file('extdata', 'dua_cw.csv', package = 'duawranglr')
set_dua_cw(dua_cw)
## --------------

## see level i options
see_dua_options(level = 'level_i')

## compare two levels of options
see_dua_options(level = c('level_i','level_ii'))

## show all option levels
see_dua_options()




