library(aqp)


### Name: getSoilDepthClass
### Title: Generate Soil Depth Class Matrix
### Aliases: getSoilDepthClass
### Keywords: manip

### ** Examples

data(sp1)
depths(sp1) <- id ~ top + bottom

# generate depth-class matrix
sdc <- getSoilDepthClass(sp1, name='name', top='top', bottom='bottom')

# inspect
head(sdc)

# join back into sp1 as site-level data
site(sp1) <- sdc

## Not run: 
##D # sample data
##D data(gopheridge, package='soilDB')
##D 
##D getSoilDepthClass(gopheridge)
## End(Not run)



