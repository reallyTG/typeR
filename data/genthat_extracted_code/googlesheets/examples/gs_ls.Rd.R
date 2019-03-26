library(googlesheets)


### Name: gs_ls
### Title: List sheets a la Google Sheets home screen
### Aliases: gs_ls

### ** Examples

## Not run: 
##D gs_ls()
##D 
##D yo_names <- paste0(c("yo", "YO"), c("", 1:3))
##D yo_ret <- yo_names %>% lapply(gs_new)
##D gs_ls("yo")
##D gs_ls("yo", ignore.case = TRUE)
##D gs_ls("yo[23]", ignore.case = TRUE)
##D gs_grepdel("yo", ignore.case = TRUE)
##D gs_ls("yo", ignore.case = TRUE)
##D 
##D c("foo", "yo") %>% lapply(gs_new)
##D gs_ls("yo")
##D gs_ls("yo|foo")
##D gs_ls(c("foo", "yo"))
##D gs_vecdel(c("foo", "yo"))
##D 
## End(Not run)




