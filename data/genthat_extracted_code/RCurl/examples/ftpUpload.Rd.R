library(RCurl)


### Name: ftpUpload
### Title: Upload content via FTP
### Aliases: ftpUpload
### Keywords: IO programming

### ** Examples

 ## Not run: 
##D 
##D   ftpUpload(I("Some text to be uploaded into a file\nwith several lines"),
##D             "ftp://login:password@laptop17/ftp/zoe",
##D             )
##D 
##D   ftpUpload(I("Some text to be uploaded into a file\nwith several lines"),
##D             "ftp://laptop17/ftp/zoe",
##D             userpwd = "login:password"
##D             )
##D 
##D   ftpUpload(system.file("examples", "system.png", package = "RCurl"), 
##D             "ftp://login:password@laptop17/ftp/Election.rda",
##D             postquote = c("CWD subdir", "RNFR Election.rda", "RNTO ElectionPolls.rda")
##D             )
##D  
## End(Not run)



