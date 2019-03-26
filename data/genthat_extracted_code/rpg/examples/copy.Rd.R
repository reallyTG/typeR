library(rpg)


### Name: copy_from
### Title: Bulk read and write
### Aliases: copy_from copy_to

### ** Examples

## Not run: 
##D # example requires hflights
##D if (! require(hflights, quietly = TRUE))
##D  stop("This example requires the \'hflights\' package")
##D 
##D # big dataset
##D data(hflights)
##D dim(hflights)
##D 
##D system(paste("createdb rpgtesting"))
##D 
##D opts = paste("-d rpgtesting")
##D system.time(copy_to(hflights, psql_opts = opts))
##D system.time(invisible(copy_from("hflights", psql_opts = opts)))
##D 
##D connect("rpgtesting")
##D begin()
##D 
##D ## Sloooowwwwwww
##D ## system.time(write_table(hflights))
##D system.time(invisible(read_table("hflights")))
##D 
##D rollback()
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run)




