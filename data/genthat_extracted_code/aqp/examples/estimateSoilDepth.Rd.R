library(aqp)


### Name: estimateSoilDepth
### Title: Estimate Soil Depth
### Aliases: estimateSoilDepth
### Keywords: manip

### ** Examples

data(sp1)
depths(sp1) <- id ~ top + bottom

# apply to each profile in a collection, and save as site-level attribute
sp1$depth <- profileApply(sp1, estimateSoilDepth, name='name', top='top', bottom='bottom')

# this function can be used to "find" depth to any feature 
# that can be defined via REGEX pattern matching on the horizon name
# for example, locate the depth to the top "Bt" horizon
# returning NA when there is no match
sp1$top_Bt <- profileApply(sp1, estimateSoilDepth, name='name', top='top', 
                           bottom='bottom', p='Bt', no.contact.depth=0, no.contact.assigned=NA)

# reduced margins
par(mar=c(1,1,1,2))
# adjust default y-offset and depth scaling for following examples
plot(sp1, y.offset=10, scaling.factor=0.5)

# get plotting parameters for profile widths and depth scaling factors
lsp <- get("last_spc_plot", envir = aqp.env)

# positions on x-axis, same for both depth and top "Bt" horizon
x.positions <- (1:length(sp1)) - lsp$width

# annotate contact with unicode right-arrow
# y-position is adjusted based on plot y-offset and scaling factor
y.positions <- lsp$y.offset + (sp1$depth * lsp$scaling.factor)
text(x.positions, y.positions, '\u2192', col='red', adj=1, cex=1.25, lwd=2)

# annotate top "Bt" depth with unicode right-arrow
# y-position is adjusted based on plot y-offset and scaling factor
y.positions <- lsp$y.offset + (sp1$top_Bt * lsp$scaling.factor)
text(x.positions, y.positions, '\u2192', col='blue', adj=1, cex=1.25, lwd=2)


## Not run: 
##D # sample data
##D data(gopheridge, package='soilDB')
##D 
##D # run on a single profile
##D estimateSoilDepth(gopheridge[1, ])
##D 
##D # apply to an entire collection
##D profileApply(gopheridge, estimateSoilDepth)
## End(Not run)



