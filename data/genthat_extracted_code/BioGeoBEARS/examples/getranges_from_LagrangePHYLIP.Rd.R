library(BioGeoBEARS)


### Name: getranges_from_LagrangePHYLIP
### Title: Read a LAGRANGE PHYLIP-style file containing geographic ranges
###   into a 'tipranges' object
### Aliases: getranges_from_LagrangePHYLIP

### ** Examples

testval=1

# Get the example files directory
extdata_dir = np(system.file("extdata", package="BioGeoBEARS"))
# tmp hard code:
# extdata_dir = "/Dropbox/_njm/__packages/BioGeoBEARS_setup/inst/extdata/"
# Set the filename (Hawaiian Psychotria from Ree & Smith 2008)
fn = np(paste(extdata_dir, "/Psychotria_geog.data", sep=""))
getranges_from_LagrangePHYLIP(lgdata_fn=fn)



