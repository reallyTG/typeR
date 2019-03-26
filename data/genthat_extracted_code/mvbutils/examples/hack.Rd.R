library(mvbutils)


### Name: hack
### Title: Modify standard R functions, including tweaking their default
###   arguments
### Aliases: hack assign.to.base
### Keywords: programming

### ** Examples

## Not run: 
##D hack( dir, all.files=getOption( "ls.all.files", TRUE)) # from my '.First'
##D assign.to.base( "dir", hack( dir, all.files=TRUE))
## End(Not run)



