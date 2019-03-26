library(soundgen)


### Name: reformatAnchors
### Title: Reformat anchors
### Aliases: reformatAnchors
### Keywords: internal

### ** Examples

soundgen:::reformatAnchors(150)
soundgen:::reformatAnchors(c(150, 200, 220))
soundgen:::reformatAnchors(anchors = list(value=c(150, 200, 220)))
soundgen:::reformatAnchors(anchors = list(time = c(0, 10, 100),
                                          value = c(150, 200, 220)))
# returns NA
soundgen:::reformatAnchors('aha')
# returns NA with a warning
soundgen:::reformatAnchors(anchors = list(time = c(0, .1, 1),
                                          freq = c(150, 200, 220)))
## Not run: 
##D # throws a warning and rearranges in order of time stamps
##D soundgen:::reformatAnchors(anchors = list(time = c(0, .8, .7, 1),
##D                                           value = c(150, 200, 150, 220)))
## End(Not run)



