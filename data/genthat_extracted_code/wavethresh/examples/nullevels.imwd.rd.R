library(wavethresh)


### Name: nullevels.imwd
### Title: Sets whole resolution levels of coefficients equal to zero in a
###   imwd object.
### Aliases: nullevels.imwd
### Keywords: manip

### ** Examples

#
# Do the wavelet transform of the Lennon image
#
data(lennon)
lenimwd <- imwd(lennon)
#
# Set scales (resolution levels) 2, 4 and 6 equal to zero.
#
lenwdNL <- nullevels(lenimwd, levelstonull=c(2,4,6))
#
# Now let's plot the coefficients using a nice blue-heat colour map
#
# You will see that coefficients at levels 2, 4 and 6 are black (i.e. zero)
# You can see that coefficients at other levels are unaffected and still
# show the Lennon coefficients.
#
## Not run: plot(lenwdNL)



