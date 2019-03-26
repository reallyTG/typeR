library(duawranglr)


### Name: set_dua_cw
### Title: Function to set data usage agreement data crosswalk
### Aliases: set_dua_cw

### ** Examples

## path to DUA crosswalk file
dua_cw <- system.file('extdata', 'dua_cw.csv', package = 'duawranglr')

## set DUA restrictions using crosswalk file
set_dua_cw(dua_cw)

## Not run: 
##D ## set using crosswalks stored in other file types
##D set_dua_cw('dua_cw.dta')
##D set_dua_cw('dua_cw.txt', delimiter = '|')
##D set_dua_cw('dua_cw.csv', remap_list = list('level_i_new' = 'level_i_old'))
## End(Not run)




