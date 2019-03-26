library(Rraven)


### Name: imp_syrinx
### Title: Import 'Syrinx' selections
### Aliases: imp_syrinx

### ** Examples

## Not run: 
##D #load data 
##D data(selection_files)
##D 
##D #save 'Raven' selection tables in the temporary directory 
##D writeLines(selection_files[[7]], con = names(selection_files)[7])
##D 
##D syr.dat <- imp_syrinx(all.data = FALSE)
##D 
##D # View(syr.dat)
##D 
##D #getting all the data
##D syr.dat <- imp_syrinx(all.data = TRUE)
##D 
##D # View(syr.dat)
## End(Not run)




