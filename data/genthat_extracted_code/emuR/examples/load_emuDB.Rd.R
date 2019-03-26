library(emuR)


### Name: load_emuDB
### Title: Load emuDB
### Aliases: load_emuDB
### Keywords: DBconfig database emuDB

### ** Examples

## Not run: 
##D ## Load database ae in directory /homes/mylogin/EMUnew/ae 
##D ## assuming an existing emuDB structure in this directory
##D 
##D ae = load_emuDB("/homes/mylogin/EMU/ae")
##D 
##D ## Load database ae from demo data
##D 
##D # create demo data in temporary directory
##D create_emuRdemoData(dir = tempdir())
##D # build base path to demo emuDB
##D demoDatabaseDir = file.path(tempdir(), "emuR_demoData", "ae_emuDB")
##D 
##D # load demo emuDB
##D ae = load_emuDB(demoDatabaseDir)
##D 
## End(Not run)



