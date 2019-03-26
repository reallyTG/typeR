library(spatstat)


### Name: unmark
### Title: Remove Marks
### Aliases: unmark unmark.ppp unmark.splitppp unmark.psp unmark.ppx
### Keywords: spatial manip

### ** Examples

  data(lansing)
  hicks <- lansing[lansing$marks == "hickory", ]
  ## Not run: 
##D   plot(hicks)  # still a marked point pattern, but only 1 value of marks
##D   plot(unmark(hicks)) # unmarked
##D   
## End(Not run)



