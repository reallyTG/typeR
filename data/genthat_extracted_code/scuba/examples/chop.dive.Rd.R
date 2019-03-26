library(scuba)


### Name: chop.dive
### Title: Extract Part of a Dive Profile
### Aliases: chop.dive
### Keywords: utilities

### ** Examples

   d <- dive(c(30,20), c(5,5))
   # fragment of dive up to 10 minutes
   chop.dive(d, 0, 10)
   # dive aborted at 10 minutes
   dive(chop.dive(d, 0, 10))



