library(grainchanger)


### Name: winmove
### Title: Create moving window surface
### Aliases: winmove
### Keywords: focal, spatial

### ** Examples

# load required data
data(cat_ls)
data(cont_ls)

# calculate the moving window mean
d = winmove(cont_ls, 5, "rectangle", "mean")

# calculate the moving window Shannon evenness
d = winmove(cat_ls, 5, "rectangle", "shei", lc_class = 0:3)




