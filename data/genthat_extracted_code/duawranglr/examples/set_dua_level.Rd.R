library(duawranglr)


### Name: set_dua_level
### Title: Set data restriction level
### Aliases: set_dua_level

### ** Examples

## --------------
## Setup
## --------------
## set DUA crosswalk
dua_cw <- system.file('extdata', 'dua_cw.csv', package = 'duawranglr')
set_dua_cw(dua_cw)
## --------------

## set restrictions at first level
set_dua_level('level_i')

## ...same, but set unique ID column to be deidentified
set_dua_level('level_i', deidentify_required = TRUE, id_column = 'sid')




