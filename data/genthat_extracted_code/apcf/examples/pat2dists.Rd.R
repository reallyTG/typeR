library(apcf)


### Name: pat2dists
### Title: Convert a Pattern to Distances & Ratios
### Aliases: pat2dists

### ** Examples

# it's advised against setting n_sim < 199
ds <- pat2dists(area=system.file("shapes/sim_area.shp", package="apcf"),
                pattern=system.file("shapes/sim_pat_reg.shp", package="apcf"),
                max_dist=25, n_sim=3, verbose=TRUE)




