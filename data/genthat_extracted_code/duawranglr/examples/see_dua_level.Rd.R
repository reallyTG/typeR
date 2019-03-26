library(duawranglr)


### Name: see_dua_level
### Title: Show current DUA restriction level setting
### Aliases: see_dua_level

### ** Examples

## --------------
## Setup
## --------------
## set DUA crosswalk
dua_cw <- system.file('extdata', 'dua_cw.csv', package = 'duawranglr')
set_dua_cw(dua_cw)
## --------------

## set restriction level
set_dua_level('level_i')

## show name of current restriction level
see_dua_level()

## ...include names of restricted elements
see_dua_level(show_restrictions = TRUE)

## ...show variable names in order saved in crosswalk file
see_dua_level(show_restrictions = TRUE, sort_vars = FALSE)




