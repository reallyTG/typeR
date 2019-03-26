library(googlesheets)


### Name: gs_rename
### Title: Rename a spreadsheet
### Aliases: gs_rename

### ** Examples

## Not run: 
##D ss <- gs_gap() %>% gs_copy(to = "jekyll")
##D gs_ls("jekyll")                  ## see? it's there
##D ss <- ss %>% gs_rename("hyde")
##D gs_ls("hyde")                    ## see? it's got a new name
##D gs_delete(ss)
## End(Not run)



