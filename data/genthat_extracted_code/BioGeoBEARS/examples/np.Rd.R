library(BioGeoBEARS)


### Name: np
### Title: normalizePath shortcut
### Aliases: np

### ** Examples

# Get a path
extdata_dir = np(system.file("extdata", package="BioGeoBEARS"))
extdata_dir

path = paste(extdata_dir, "//", "Psychotria_5.2.newick", sep="")
path

path = np(path)
path



