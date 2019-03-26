library(oz)


### Name: oz
### Title: Plot the Australian Coastline and States
### Aliases: oz ozRegion
### Keywords: hplot

### ** Examples

oz()                    # the lot
oz(states=FALSE)        # coastlines only
oz(sections=6)          # Tasmania
oz(sections=c(7,8,10,12,14,16))         # South Australia
oz(sections=c(3,11:13), visible=c(3,13))# plot Queensland, but show just
                                        # coast and border with NSW.



