library(wavethresh)


### Name: nullevels.wd
### Title: Sets whole resolution levels of coefficients equal to zero in a
###   wd object.
### Aliases: nullevels.wd
### Keywords: manip

### ** Examples

#
# Generate some test data
#
test.data <- example.1()$y
#
# Do wavelet transform of test.data and plot the wavelet coefficients
#
wds <- wd(test.data)
## Not run: plot(wds)
#
# Now let us set all the coefficients in ODD resolution levels equal to zero!
#
# This is just to illustrate the capabilities of the function. I cannot
# imagine you wanting to do this in practice!
##
wdsnl <- nullevels(wds, levelstonull = c(1, 3, 5, 7))
#
# Now let's plot the result
#
## Not run: plot(wdsnl, scaling = "by.level")
#
# Lo and behold the odd levels have been set to zero!



