library(Rlinkedin)


### Name: submitGroupPost
### Title: Create a Group Discussion Post
### Aliases: submitGroupPost

### ** Examples

## Not run: 
##D 
##D my.groups <- getGroups(in.auth)
##D 
##D id <- my.groups$group_id[1]
##D disc.title <- "Test connecting to the LinkedIn API via R"
##D disc.summary <- "Im creating an R package to connect to the LinkedIn API, 
##D                  + this is a test post from R!"
##D url <- "https://github.com/mpiccirilli"
##D content.desc <- "Dev version of access to LinkedIn API via R. 
##D                               + Collaboration is welcomed!"
##D 
##D submitGroupPost(in.auth, group_id=id, disc_title=disc.title, 
##D disc_summary=disc.summary, content_url=url, content_desc=content.desc)
## End(Not run)



