library(hues)


### Name: iwanthue
### Title: Generate a colour palette by k-means clustering of CIE Lab
###   colour space.
### Aliases: iwanthue

### ** Examples

iwanthue(5)
iwanthue(5, plot=TRUE)
iwanthue(5, 0, 240, 0, 24, 0, 100, plot=TRUE)    # shades
iwanthue(5, 0, 360, 0, 54, 67, 100, plot=TRUE)   # pastel
iwanthue(5, 0, 360, 54, 180, 27, 67, plot=TRUE)  # pimp
iwanthue(5, 0, 360, 36, 180, 13, 73, plot=TRUE)  # intense
iwanthue(3, 0, 300, 60, 180, 73, 100, plot=TRUE) # fluoro
iwanthue(3, 220, 260, 12, 150, 0, 53, plot=TRUE) # blue ocean



