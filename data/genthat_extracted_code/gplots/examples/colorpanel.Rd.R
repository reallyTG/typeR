library(gplots)


### Name: colorpanel
### Title: Generate a smoothly varying set of colors
### Aliases: colorpanel redgreen greenred bluered redblue
### Keywords: color

### ** Examples


showpanel <- function(col)
{
  image(z=matrix(1:100, ncol=1), col=col, xaxt="n", yaxt="n" )
}

par(mfrow=c(3,3))

# two colors only:
showpanel(colorpanel(8,low="red",high="green"))

# three colors
showpanel(colorpanel(8,"red","black","green"))
# note the duplicatation of black at the center, using an odd
# number of elements resolves this:
showpanel(colorpanel(9,"red","black","green"))

showpanel(greenred(64))
showpanel(redgreen(64))
showpanel(bluered(64))
showpanel(redblue(64))




