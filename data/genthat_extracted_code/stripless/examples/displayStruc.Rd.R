library(stripless)


### Name: displayStruc
### Title: Construct text For 'strucplot' legends.
### Aliases: displayStruc

### ** Examples

require(datasets)
# quakes data
#
# Create and save plot
 out <- strucplot(lat ~ long|cut(mag,5)*cut(depth,4), data = quakes,
  col="blue", main = "Earthquake locations, by magnitude and depth")

 displayStruc(attr(out,"structure"))



