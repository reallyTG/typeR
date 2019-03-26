library(neotoma)


### Name: write_agefile
### Title: Write age control file to disk formatted for either Bacon or
###   Clam
### Aliases: write_agefile
### Keywords: API Neotoma Palaeoecology

### ** Examples

## Not run: 
##D # Find a particular record:
##D 
##D three_pines <- get_download(get_dataset(get_site("Three Pines Bog"), 
##D                                         datasettype = "pollen"))
##D 
##D # You will need to edit the `path` argument here to point to a directory that 
##D # contains a `Cores` directory.
##D 
##D write_agefile(download = three_pines[[1]], 
##D               path = "./inst", 
##D               corename = "THREEPINES", 
##D               cal.prog = "Bacon")
## End(Not run)



