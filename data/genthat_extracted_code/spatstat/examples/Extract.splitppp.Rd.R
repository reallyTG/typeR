library(spatstat)


### Name: Extract.splitppp
### Title: Extract or Replace Sub-Patterns
### Aliases: [.splitppp [<-.splitppp
### Keywords: spatial manip

### ** Examples

  data(amacrine)  # multitype point pattern
  y <- split(amacrine)
  y[1]
  y["off"]
  y[1] <- list(runifpoint(42, Window(amacrine)))
 


