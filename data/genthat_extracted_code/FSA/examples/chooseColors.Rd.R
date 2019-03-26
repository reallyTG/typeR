library(FSA)


### Name: chooseColors
### Title: Create a list of colors from among a variety of color palettes.
### Aliases: chooseColors paletteChoices
### Keywords: manip

### ** Examples

n <- 20
# Color Wheels
pie(rep(1,n), col=chooseColors("rich",n))
pie(rep(1,n), col=chooseColors("rainbow",n))
pie(rep(1,n), col=chooseColors("topo",n))
pie(rep(1,n), col=chooseColors("gray",n))
pie(rep(1,n), col=chooseColors("jet",n))
# colors reversed order
pie(rep(1,n), col=chooseColors("jet",n,rev=TRUE))




