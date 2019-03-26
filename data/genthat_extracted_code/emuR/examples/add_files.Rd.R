library(emuR)


### Name: add_files
### Title: Add files to emuDB
### Aliases: add_files
### Keywords: Emu database emuDB

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D # specify path to folder containing the following
##D # files we wish to add to: 
##D # msajc003.zcr, msajc010.zcr, msajc012.zcr, msajc015.zcr, 
##D # msajc022.zcr, msajc023.zcr and msajc057.zcr 
##D path2dir = "/path/to/dir/"
##D 
##D # add the files to session "0000" of the "ae" emuDB
##D add_files(emuDBhandle = ae,
##D           dir = path2dir,
##D           fileExtension = "zcr",
##D           targetSessionName = "0000")
##D 
## End(Not run)



