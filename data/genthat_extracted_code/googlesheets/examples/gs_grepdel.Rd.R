library(googlesheets)


### Name: gs_grepdel
### Title: Delete several spreadsheets at once by title
### Aliases: gs_grepdel gs_vecdel

### ** Examples

## Not run: 
##D sheet_title <- c("cat", "catherine", "tomCAT", "abdicate", "FLYCATCHER")
##D ss <- lapply(paste0("TEST-", sheet_title), gs_new)
##D # list, for safety!, then delete 'TEST-abdicate' and 'TEST-catherine'
##D gs_ls(regex = "TEST-[a-zA-Z]*cat[a-zA-Z]+$")
##D gs_grepdel(regex = "TEST-[a-zA-Z]*cat[a-zA-Z]+$")
##D 
##D # list, for safety!, then delete the rest,
##D # i.e. 'TEST-cat', 'TEST-tomCAT', and 'TEST-FLYCATCHER'
##D gs_ls(regex = "TEST-[a-zA-Z]*cat[a-zA-Z]*$", ignore.case = TRUE)
##D gs_grepdel(regex = "TEST-[a-zA-Z]*cat[a-zA-Z]*$", ignore.case = TRUE)
##D 
##D ## using gs_vecdel()
##D sheet_title <- c("cat", "catherine", "tomCAT", "abdicate", "FLYCATCHER")
##D ss <- lapply(paste0("TEST-", sheet_title), gs_new)
##D # delete two of these sheets
##D gs_vecdel(c("TEST-cat", "TEST-abdicate"))
##D # see? they are really gone, but the others remain
##D gs_ls(regex = "TEST-[a-zA-Z]*cat[a-zA-Z]*$", ignore.case = TRUE)
##D # delete the remainder
##D gs_vecdel(c("TEST-FLYCATCHER", "TEST-tomCAT", "TEST-catherine"))
##D # see? they are all gone now
##D gs_ls(regex = "TEST-[a-zA-Z]*cat[a-zA-Z]*$", ignore.case = TRUE)
## End(Not run)




