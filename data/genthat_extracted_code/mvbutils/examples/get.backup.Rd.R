library(mvbutils)


### Name: get.backup
### Title: Text backups of function source code
### Aliases: get.backup create.backups read.bkind
### Keywords: programming utilities documentation

### ** Examples

## Not run: 
##D ## Need some backups first
##D # Restore a function:
##D g1 <- get.backup( "myfun", "package:myfun")[[1]] # returns most recent backup only
##D # To turn this into an actual function (with source attribute as per your formatting):
##D myfun <- source.mvb( textConnection( g1)) # would be nice to have an self-closing t.c.
##D cat( get.backup( "myfun", "package:myfun", zap=FALSE)[[1]][1])
##D # shows "myfun" <- function...
##D # Restore a character vector:
##D mycharvec <- as.cat( get.backup( 'mycharvec', ..mypackage)[[1]]) # ready to roll
##D # Restore most recent backup of everything... brave!
##D # Will include functions & charvecs that have subsequently been deleted
##D bks <- read.bkind() # in current task
##D for( i in bks$object.names) {
##D   cat( "Restoring ", i, "...")
##D   gb <- get.backup( i, unlength=FALSE)[[1]] # unlength F so we can check type
##D   # Is it a charvec?
##D   if( grepl( '^ *[0-9]+ *$', gb[1])) # could check length too
##D     gb <- as.cat( gb[-1]) # remove line showing length and...
##D     # ...set class to "cat" for nice printing, as per 'as.cat'
##D   else {
##D     # Nope, so it's a function and needs to be sourced
##D     tc <- textConnection( gb)
##D     gbfun <- try( source.mvb( gb)) # will set source attribute, documentation etc.
##D     close( tc)
##D     if( gbfun %is.a% "try-error") {
##D       gbfun <- stop( function( ...) stop( ii %&% " failed to parse"), list( ii=i))
##D       attr( gbfun, 'source') <- gb # still assign source attribute
##D     }
##D     gb <- gbfun
##D   }
##D   assign( i, gb)
##D   cat( '\n')
##D }
## End(Not run)



