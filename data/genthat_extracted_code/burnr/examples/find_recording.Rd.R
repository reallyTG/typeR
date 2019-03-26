library(burnr)


### Name: find_recording
### Title: Subset 'rings' data.frame to years that are considered
###   recording.
### Aliases: find_recording

### ** Examples

require(plyr)
data(lgr2)
ddply(lgr2$rings, 'series', burnr:::find_recording, injury_event = TRUE)




