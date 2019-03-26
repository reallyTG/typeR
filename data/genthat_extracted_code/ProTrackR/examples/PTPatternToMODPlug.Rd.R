library(ProTrackR)


### Name: PTPatternToMODPlug
### Title: Convert PTPattern data into a MODPlug pattern
### Aliases: PTPatternToMODPlug

### ** Examples

## Not run: 
##D ## get some pattern data
##D 
##D pattern <- PTPattern(mod.intro, 1)
##D 
##D ## Now create a MODPlug pattern from this.
##D ## The result is placed on the system clipboard.
##D ## You can check by pasting it into a text
##D ## editor, or better yet, the MODPlug Tracker.
##D 
##D PTPatternToMODPlug(pattern)
##D 
##D ## If you want to handle the pattern data
##D ## in R:
##D 
##D patModPlug <- PTPatternToMODPlug(pattern, F)
##D 
##D ## We can do the same with a block:
##D 
##D block <- PTBlock(pattern, 1:10, 2:3)
##D PTPatternToMODPlug(block)
## End(Not run)



