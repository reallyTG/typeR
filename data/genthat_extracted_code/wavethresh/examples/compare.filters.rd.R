library(wavethresh)


### Name: compare.filters
### Title: Compares two filters.
### Aliases: compare.filters
### Keywords: manip

### ** Examples

#
# Create three filters!
#
filt1 <- filter.select(4, family="DaubExPhase")
filt2 <- filter.select(3, family="DaubExPhase")
filt3 <- filter.select(4, family="DaubLeAsymm")
#
# Now let us see if they are the same...
#
compare.filters(filt1, filt2)
# [1] FALSE
compare.filters(filt1, filt3)
# [1] FALSE
compare.filters(filt2, filt3)
# [1] FALSE
#
# Nope, (what a surprise) they weren't. How about
#
compare.filters(filt1, filt1)
# [1] TRUE
#
# Yes, they were the same!



