library(nlsem)


### Name: as.data.frame
### Title: Coerce to a Data Frame
### Aliases: as.data.frame.singleClass as.data.frame.semm
###   as.data.frame.nsemm

### ** Examples

# specify model
model <- specify_sem(num.x = 6, num.y = 3, num.xi = 2, num.eta = 1,
  xi = "x1-x3,x4-x6", eta = "y1-y3", interaction = "eta1~xi1:xi2")

# coerce to data frame
as.data.frame(model)



