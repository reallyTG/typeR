library(grainchanger)


### Name: winmove_agg
### Title: Moving-window data aggregation
### Aliases: winmove_agg
### Keywords: aggregate focal, spatial,

### ** Examples

# load required data
data(g_sf)
data(cont_ls)
data(cat_ls)

#'# aggregate using mean
d = winmove_agg(g_sf, cont_ls, 5, "rectangle", "mean")

# aggregate using Shannon evenness
d = winmove_agg(g_sf, cat_ls, 5, "rectangle", "shei", lc_class = 0:3)




