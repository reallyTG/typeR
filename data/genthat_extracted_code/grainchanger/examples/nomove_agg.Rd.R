library(grainchanger)


### Name: nomove_agg
### Title: Direct data aggregation
### Aliases: nomove_agg
### Keywords: aggregate spatial,

### ** Examples

# load required data
data(g_sf)
data(cont_ls)
data(cat_ls)

# aggregate using mean
d = nomove_agg(g_sf, cont_ls, "mean")

# aggregate using Shannon evenness
d = nomove_agg(g_sf, cont_ls, "nm_shei", lc_class = 0:3)




