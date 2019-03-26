library(aqp)


### Name: groupedProfilePlot
### Title: Grouped Soil Profile Plot
### Aliases: groupedProfilePlot
### Keywords: hplots

### ** Examples

# sample data
data(sp1)
# convert colors from Munsell to hex-encoded RGB
sp1$soil_color <- with(sp1, munsell2rgb(hue, value, chroma))

# promote to SoilProfileCollection
depths(sp1) <- id ~ top + bottom
site(sp1) <- ~ group

# plot profiles, sorted and annotated by 'group'
par(mar=c(1,1,1,1))
groupedProfilePlot(sp1, groups='group', max.depth=150, group.name.offset = -12, id.style='side')

# make fake site-level attribute and adjust levels
sp1$new.group <- sample(letters[1:3], size=length(sp1), replace=TRUE)

# tabulate pedons / group
tab <- table(sp1$new.group)

# sort large -> small
tab <- sort(tab, decreasing = TRUE)

# set levels based on sorted tabulation
# assign custom labels
sp1$new.group <- factor(sp1$new.group, levels=names(tab), 
labels=paste0(names(tab), ' (', tab, ')'))
groupedProfilePlot(sp1, groups='new.group', max.depth=150, 
group.name.offset = -10, id.style='side')

# offsets can be set using a vector of values, recycled as needed
groupedProfilePlot(sp1, groups='new.group', max.depth=150, 
group.name.offset=c(-10, -5), id.style='side')

# annotate with arrows instead of vertical lines
groupedProfilePlot(sp1, groups='new.group', max.depth=150, 
group.name.offset=c(-10, -12), break.style='arrow', arrow.offset=-3, 
group.line.lty = 1, group.line.lwd = 1, id.style='side')

## Not run: 
##D # more complete example using data from soilDB package
##D data(loafercreek, package='soilDB')
##D par(mar=c(1,1,1,1))
##D # lines
##D groupedProfilePlot(loafercreek, groups='hillslope_pos', group.name.cex = 0.5, 
##D group.name.offset = -10)
##D 
##D # arrows
##D groupedProfilePlot(loafercreek, groups='hillslope_pos', group.name.cex = 0.5, 
##D group.name.offset = -10, break.style ='arrow', group.line.lty = 1, 
##D group.line.lwd = 1)
##D 
##D # both
##D groupedProfilePlot(loafercreek, groups='hillslope_pos', group.name.cex = 0.5, 
##D group.name.offset = -10, break.style ='both', group.line.lty = 1, 
##D group.line.lwd = 1)
## End(Not run)



