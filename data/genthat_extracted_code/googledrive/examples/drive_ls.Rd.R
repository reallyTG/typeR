library(googledrive)


### Name: drive_ls
### Title: List contents of a folder or Team Drive
### Aliases: drive_ls

### ** Examples

## Not run: 
##D ## get contents of the folder 'abc' (non-recursive)
##D drive_ls("abc")
##D 
##D ## get contents of folder 'abc' whose names contain the letters 'def'
##D drive_ls(path = "abc", pattern = "def")
##D 
##D ## get all Google spreadsheets in folder 'abc'
##D ## whose names contain the letters 'def'
##D drive_ls(path = "abc", pattern = "def", type = "spreadsheet")
##D 
##D ## get all the files below 'abc', recursively, that are starred
##D drive_ls(path = "abc", q = "starred = true", recursive = TRUE)
## End(Not run)



