library(wavethresh)


### Name: rmget
### Title: Search for existing ipndacw matrices.
### Aliases: rmget
### Keywords: manip

### ** Examples

#
# Suppose there are no matrices in the search path.
#
# Let's look for the matrix rm.4.1.DaubExPhase (Haar wavelet matrix of
# order 4)
#
rmget(requestJ=4, filter.number=1, family="DaubExPhase")
#NULL
#
# I.e. a NULL return code. So there were no suitable matrices.
#
#If we create two Haar ipndacw matrix of order 7 and 8
#
ipndacw(-7, filter.number=1, family="DaubExPhase")
ipndacw(-8, filter.number=1, family="DaubExPhase")
#
# Now let's repeat the earlier search
#
rmget(requestJ=4, filter.number=1, family="DaubExPhase")
#[1] 7
#
# So, as we the smallest Haar ipndacw matrix available larger than
# the requested order of 4 is "7".
#



