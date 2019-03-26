library(ProTrackR)


### Name: write.module
### Title: Export an PTModule object as a ProTracker module file
### Aliases: write.module write.module,PTModule,ANY-method
###   write.module,PTModule,character-method

### ** Examples

## get the PTModule object provided with the ProTrackR package
data("mod.intro")

## save the object as a valid ProTracker module file:
write.module(mod.intro, "intro.mod")

## or create the connection yourself:
con <- file("intro2.mod", "wb")
write.module(mod.intro, con)

## don't forget to close the connection after you're done:
close(con)



