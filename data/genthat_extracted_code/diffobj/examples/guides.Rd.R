library(diffobj)


### Name: guides
### Title: Generic Methods to Implement Flexible Guide Line Computations
### Aliases: guides guidesPrint, guidesStr, guidesChr, guidesDeparse
###   guidesPrint guidesPrint,ANY,character-method guidesStr
###   guidesStr,ANY,character-method guidesChr
###   guidesChr,ANY,character-method guidesDeparse
###   guidesDeparse,ANY,character-method guidesFile
###   guidesFile,ANY,character-method

### ** Examples

## Roundabout way of suppressing guides for matrices
setMethod("guidesPrint", c("matrix", "character"),
  function(obj, obj.as.chr) integer(0L)
)
## Special guides for "zulu" S3 objects that match lines
## starting in "zulu###" where ### is a nuber
setOldClass("zulu")
setMethod("guidesPrint", c("zulu", "character"),
  function(obj, obj.as.chr) {
    if(length(obj) > 20) grep("^zulu[0-9]*", obj.as.chr)
    else integer(0L)
} )



