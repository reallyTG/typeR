library(spatstat)


### Name: summary.ppp
### Title: Summary of a Point Pattern Dataset
### Aliases: summary.ppp
### Keywords: spatial methods

### ** Examples

  summary(cells)  # plain vanilla point pattern

  # multitype point pattern
  woods <- lansing
  ## Don't show: 
woods <- woods[seq(1, npoints(woods), length=40)]
## End(Don't show)
  summary(woods) # tabulates frequencies of each mark
  
  # numeric marks
  trees <- longleaf
  ## Don't show: 
trees <- trees[seq(1, npoints(trees), length=40)]
## End(Don't show)
  summary(trees) # prints summary.default(marks(trees))

  # weird polygonal window
  summary(demopat)  # describes it



