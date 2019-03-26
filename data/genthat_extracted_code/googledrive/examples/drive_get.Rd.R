library(googledrive)


### Name: drive_get
### Title: Get Drive files by path or id
### Aliases: drive_get

### ** Examples

## Not run: 
##D ## get info about your "My Drive" root folder
##D drive_get("~/")
##D ## the API reserves the file id "root" for your root folder
##D drive_get(id = "root")
##D drive_get(id = "root") %>% drive_reveal("path")
##D 
##D ## multiple names
##D drive_get(c("abc", "def"))
##D 
##D ## multiple names, one of which must be a folder
##D drive_get(c("abc", "def/"))
##D 
##D ## query by file id(s)
##D drive_get(id = "abcdefgeh123456789")
##D drive_get(as_id("abcdefgeh123456789"))
##D drive_get(id = c("abcdefgh123456789", "jklmnopq123456789"))
##D 
##D ## access the Team Drive named "foo"
##D ## team_drive params must be specified if getting by path
##D foo <- team_drive_get("foo")
##D drive_get(c("this.jpg", "that-file"), team_drive = foo)
##D ## team_drive params are not necessary if getting by id
##D drive_get(as_id("123456789"))
##D 
##D ## search all Team Drives and other files user has accessed
##D drive_get(c("this.jpg", "that-file"), corpus = "all")
## End(Not run)



