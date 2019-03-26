library(TrackReconstruction)


### Name: GapFinder
### Title: Find gaps in your data file
### Aliases: GapFinder
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(rawdatagap)
gaps<-GapFinder(rawdatagap, timediff = 1, timeformat = "%d-%b-%Y %H:%M:%S")

#how timediff and a lack of decimal seconds information interact given an Hz of 16.
gaps<-GapFinder(rawdatagap, timediff = 1/16, timeformat = "%d-%b-%Y %H:%M:%S")




