library(BioGeoBEARS)


### Name: order_tipranges_by_tree_tips
### Title: Reorder the rows in a 'tipranges' object, to correspond to tree
###   tips
### Aliases: order_tipranges_by_tree_tips

### ** Examples

testval=1

# Get the example files directory
extdata_dir = np(system.file("extdata", package="BioGeoBEARS"))
# tmp hard code:
# extdata_dir = "/Dropbox/_njm/__packages/BioGeoBEARS_setup/inst/extdata/"
# Set the filename (Hawaiian Psychotria from Ree & Smith 2008)

trfn = np(paste(extdata_dir, "/Psychotria_5.2.newick", sep=""))
tr = read.tree(trfn)

fn = np(paste(extdata_dir, "/Psychotria_geog.data", sep=""))
tipranges1 = getranges_from_LagrangePHYLIP(lgdata_fn=fn)
tipranges1

# Reorder the tipranges object
tipranges2 = order_tipranges_by_tree_tips(tipranges1, tr)
tipranges2



