library(BioGeoBEARS)


### Name: bears_2param_standard_slowQ_slowSP
### Title: 2-parameter model, fixed cladogenesis model - slow version
### Aliases: bears_2param_standard_slowQ_slowSP

### ** Examples

test=1

# Get the example files directory
extdata_dir = np(system.file("extdata", package="BioGeoBEARS"))
# tmp hard code: extdata_dir = "/Dropbox/_njm/__packages/BioGeoBEARS_setup/inst/extdata/"

# Set the filenames (Hawaiian Psychotria from Ree & Smith 2008)
trfn = np(paste(extdata_dir, "/Psychotria_5.2.newick", sep=""))
tr = read.tree(file=trfn)

geogfn = np(paste(extdata_dir, "/Psychotria_geog.data", sep=""))

# Look at the tree and ranges, for kicks
getranges_from_LagrangePHYLIP(lgdata_fn=geogfn)
tr

## Not run: 
##D # Run the ML search
##D bears_output = bears_2param_standard_slowQ_slowSP(trfn=trfn, geogfn=geogfn)
##D bears_output
## End(Not run)



