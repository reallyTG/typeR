library(worrms)


### Name: wm_records_common
### Title: Get records by vernacular name, optional fuzzy matching
### Aliases: wm_records_common wm_records_common_

### ** Examples

## Not run: 
##D wm_records_common(name = 'dolphin')
##D wm_records_common(name = 'clam')
##D 
##D wm_records_common_(name = c('dolphin', 'clam'))
##D 
##D wm_records_common(name = 'dolphin', fuzzy = TRUE)
##D wm_records_common(name = 'clam', fuzzy = TRUE, offset = 5)
## End(Not run)



