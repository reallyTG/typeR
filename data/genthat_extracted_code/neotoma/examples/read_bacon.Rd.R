library(neotoma)


### Name: read_bacon
### Title: Function to read in defined Bacon outputs.
### Aliases: read_bacon

### ** Examples

## Not run: 
##D # Download the record for Lake O' Pines:
##D lake_o_dl <- get_download(15925)
##D 
##D # This assumes that you have Bacon installed in a folder and have
##D # set it to your working directory.
##D 
##D write_agefile(lake_o_dl[[1]], path = ".", chronology = 1, 
##D               corename = "LAKEPINES", cal.prog = 'Bacon') 
##D 
##D source("Bacon.R") 
##D 
##D # These defaults just help the core run quickly, they're not 
##D # neccesarily good parameters.
##D 
##D Bacon("LAKEPINES", acc.mean = 10, 
##D       thick = 50, depths.file = TRUE, 
##D       suggest = FALSE, ask = FALSE)
##D 
##D lake_o_dl <- read_bacon("LAKEPINES", add = TRUE, 
##D                         download = download, sections = 17)
##D 
## End(Not run)



