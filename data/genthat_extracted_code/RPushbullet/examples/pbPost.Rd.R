library(RPushbullet)


### Name: pbPost
### Title: Post a message via Pushbullet
### Aliases: pbPost

### ** Examples

## Not run: 
##D # A note
##D pbPost("note", "A Simple Test", "We think this should work.\nWe really do.")
##D 
##D # A URL -- should open browser
##D pbPost(type="link", title="Some title", body="Some URL",
##D        url="http://cran.r-project.org/package=RPushbullet")
##D 
##D # A file
##D pbPost(type="file", url=system.file("DESCRIPTION", package="RPushbullet"))
## End(Not run)



