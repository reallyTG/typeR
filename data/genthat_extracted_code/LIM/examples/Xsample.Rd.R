library(LIM)


### Name: Xsample
### Title: Generates a random sample of the unknowns for a linear inverse
###   problem
### Aliases: Xsample
### Keywords: optimize utilities

### ** Examples
# sample solution space
  xs <- Xsample(LIMRigaAutumn, iter = 500, jmp = 5)
  # remove flows that are invariable (sd=0)
  xs <- xs[ ,-which(apply(xs, 2, sd) == 0 )]
  #pairs plot
  pairs(xs, gap = 0, pch = ".", upper.panel = NULL)



