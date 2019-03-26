library(rpg)


### Name: libpq_version
### Title: Miscelaneous functions
### Aliases: libpq_version encrypt_password get_encoding set_encoding
###   set_error_verbosity toggle_echo enable_postgis enable_extension

### ** Examples

## Not run: 
##D # try connecting to default database
##D createdb("rpgtesting")
##D connect("rpgtesting")
##D begin()
##D 
##D libpq_version()
##D encrypt_password("test", "tester")
##D get_encoding()
##D set_encoding("UTF8")
##D set_error_verbosity("terse")
##D set_error_verbosity("verbose")
##D set_error_verbosity("default")
##D enable_postgis()
##D 
##D # cleanup
##D rollback()
##D disconnect()
##D dropdb("rpgtesting")
## End(Not run)




