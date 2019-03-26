library(oceanmap)


### Name: close_fig
### Title: function to close current graphic device
### Aliases: close_fig

### ** Examples

do.save <- TRUE
figure("Gulf_of_Lions", do.save=do.save, width=5, height=5, type="pdf")
plotmap("lion")
close_fig(do.save)

plotmap("lion")
close_fig(do.save)

do.save <- FALSE
figure("Gulf_of_Lions", do.save=do.save, width=5, height=5, type="pdf")
plotmap("lion")
close_fig(do.save)




