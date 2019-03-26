library(nlsem)


### Name: create_sem
### Title: Create a structural equation model from a data frame
### Aliases: create_sem

### ** Examples

# specify model
model <- specify_sem(num.x = 4, num.y = 1, num.xi = 2, num.eta = 1, 
  xi = "x1-x2,x3-x4", eta = "y1", interaction = "eta1~xi1:xi2")
# create data frame
dat <- as.data.frame(model)
# recreate model
create_sem(dat)



