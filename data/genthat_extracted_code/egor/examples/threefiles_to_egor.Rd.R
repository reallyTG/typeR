library(egor)


### Name: threefiles_to_egor
### Title: Read/ import ego-centered network data from the three files
###   format, EgoWeb2.0 or openeddi.
### Aliases: threefiles_to_egor read_egoweb read_openeddi

### ** Examples

# The data for read.egonet.threefiles() needs to be loaded with read.csv(), 
# for it to be converted to an egoR object.
egos.file <-  system.file("extdata", "egos_32.csv", package = "egor")
alters.file <- system.file("extdata", "alters_32.csv", package = "egor")
edges.file <-  system.file("extdata", "edges_32.csv", package = "egor")

egos <- read.csv2(egos.file)
alters <- read.csv2(alters.file)
edges <- read.csv2(edges.file)

tf <- threefiles_to_egor(egos = egos, alters.df = alters, edges = edges)

# read_egoweb() and read_openeddi() read the files directly from the disk.
## No test: 
#' # Fetch current working directory
wd <- getwd()

#' setwd(system.file("extdata", "openeddi", package = "egor"))
oe <- read_openeddi()

setwd(system.file("extdata", "egoweb", package = "egor"))
ew <- read_egoweb(alter.file = "alters_32.csv", edges.file = "edges_32.csv", 
                  egos.file = "egos_32.csv")
                  
# Restore working directory                   
setwd(wd)
## End(No test)



