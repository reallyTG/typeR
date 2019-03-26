library(BioGeoBEARS)


### Name: save_tipranges_to_LagrangePHYLIP
### Title: Save a tipranges object to a LAGRANGE PHYLIP-style file
###   containing binary-encoded geographic ranges
### Aliases: save_tipranges_to_LagrangePHYLIP

### ** Examples

testval=1

# Create an example tipranges object
tipranges = define_tipranges_object()

# See current directory
getwd()

## Not run: 
##D # Save the file
##D # Set the filename
##D fn = "example_tipranges.data"
##D save_tipranges_to_LagrangePHYLIP(tipranges_object=tipranges, lgdata_fn=fn)
##D 
##D # Show the file
##D tmplines = scan(file=fn, what="character", sep="\n")
##D cat(tmplines, sep="\n")
##D 
##D # Again, with areanames
##D save_tipranges_to_LagrangePHYLIP(tipranges_object=tipranges,
##D lgdata_fn=fn, areanames=c("area1","area2","area3"))
##D 
##D # Show the file
##D tmplines = scan(file=fn, what="character", sep="\n")
##D cat(tmplines, sep="\n")
## End(Not run) # End dontrun



