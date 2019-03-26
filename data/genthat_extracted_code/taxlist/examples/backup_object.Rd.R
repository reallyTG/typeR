library(taxlist)


### Name: backup_object
### Title: Make and load Backups of R Objects
### Aliases: backup_object load_last

### ** Examples

## Not run: 
##D library(taxlist)
##D data(Easplist)
##D 
##D ## A subset with Pseudognaphalium and relatives
##D Pseudognaphalium <- subset(Easplist, grepl("Pseudognaphalium", TaxonName),
##D 	slot="names")
##D Pseudognaphalium <- get_parents(Easplist, Pseudognaphalium)
##D 
##D ## Create a backup with date stamp
##D backup_object(Pseudognaphalium, file="Pseudonaphalium")
##D 
##D ## The same
##D backup_object(objects="Pseudognaphalium", file="Pseudonaphalium")
##D 
##D ## To load the last backup into a session
##D load_last("Pseudognaphalium")
## End(Not run)



