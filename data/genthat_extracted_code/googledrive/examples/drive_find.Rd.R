library(googledrive)


### Name: drive_find
### Title: Find files on Google Drive
### Aliases: drive_find

### ** Examples

## Not run: 
##D ## list "My Drive" w/o regard for folder hierarchy
##D drive_find()
##D 
##D ## filter for folders, the easy way and the hard way
##D drive_find(type = "folder")
##D drive_find(q = "mimeType = 'application/vnd.google-apps.folder'")
##D 
##D ## filter for Google Sheets, the easy way and the hard way
##D drive_find(type = "spreadsheet")
##D drive_find(q = "mimeType='application/vnd.google-apps.spreadsheet'")
##D 
##D ## files whose names match a regex
##D drive_find(pattern = "jt")
##D 
##D ## search for files located directly in your root folder
##D drive_find(q = "'root' in parents")
##D ## FYI: this is equivalent to
##D drive_ls("~/")
##D 
##D ## control page size or cap the number of files returned
##D drive_find(pageSize = 50)
##D ## all params passed through `...` can be camelCase or snake_case
##D drive_find(page_size = 50)
##D drive_find(n_max = 58)
##D drive_find(page_size = 5, n_max = 15)
##D 
##D ## various ways to specify q search clauses
##D ## multiple q's
##D drive_find(q = "name contains 'TEST'",
##D            q = "modifiedTime > '2017-07-21T12:00:00'")
##D ## vector q
##D drive_find(q = c("starred = true", "visibility = 'anyoneWithLink'"))
##D 
##D ## default `trashed = FALSE` excludes files in the trash
##D ## `trashed = TRUE` consults ONLY file in the trash
##D drive_find(trashed = TRUE)
##D ## `trashed = NA` disregards trash status completely
##D drive_find(trashed = NA)
## End(Not run)




