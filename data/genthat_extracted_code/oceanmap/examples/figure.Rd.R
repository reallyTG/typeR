library(oceanmap)


### Name: figure
### Title: generate (and save) graphic devices with flexible fileformat
###   selection
### Aliases: figure

### ** Examples

## Example 1: plotmap() and figure()
do.save <- FALSE
figure("Gulf_of_Lions_extended", do.save=do.save, width=5, height=5, type="pdf")
plotmap("lion")
close_fig(do.save)

## now resize figure manually and get new figure dimensions:
width <- dev.size()[1]
height <- dev.size()[2]

do.save <- TRUE
figure("Gulf_of_Lions_extended", do.save=do.save, width=width, height=height, type="pdf")
plotmap("lion")
close_fig(do.save)







