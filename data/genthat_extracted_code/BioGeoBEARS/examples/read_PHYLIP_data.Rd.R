library(BioGeoBEARS)


### Name: read_PHYLIP_data
### Title: Read a PHYLIP-format file
### Aliases: read_PHYLIP_data

### ** Examples

testval=1

# Get the example files directory
extdata_dir = np(system.file("extdata", package="BioGeoBEARS"))
# tmp hard code: extdata_dir = "/Dropbox/_njm/__packages/BioGeoBEARS_setup/inst/extdata/"
# Set the filename (Hawaiian Psychotria from Ree & Smith 2008)
fn = np(paste(extdata_dir, "/Psychotria_geog.data", sep=""))

# Read in the file
tmpdf = read_PHYLIP_data(lgdata_fn=fn, regionnames=NULL)
tmpdf

# Read in the file
tmpdf = read_PHYLIP_data(lgdata_fn=fn,
regionnames=c("Kauai", "Oahu", "Maui-Nui","Big Island"))
tmpdf	# Note that regionnames are only
# used if they are NOT specified in the file.
# But, you could put them on manually
names(tmpdf) = c("Kauai", "Oahu", "Maui-Nui","Big Island")
tmpdf

# This one has no area names
fn = np(paste(extdata_dir, "/Psychotria_geog_noAreaNames.data", sep=""))
tmpdf = read_PHYLIP_data(lgdata_fn=fn,
regionnames=c("Kauai", "Oahu", "Maui-Nui","Big Island"))
tmpdf	# Note that regionnames are only
# used if they are NOT specified in the file.



