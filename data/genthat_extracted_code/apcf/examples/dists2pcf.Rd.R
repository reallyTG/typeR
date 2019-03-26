library(apcf)


### Name: dists2pcf
### Title: Convert Distances & Ratios to PCF
### Aliases: dists2pcf

### ** Examples

# it's advised against setting n_sim < 199
ds <- pat2dists(area=system.file("shapes/sim_area.shp", package="apcf"),
                pattern=system.file("shapes/sim_pat_reg.shp", package="apcf"),
                max_dist=25, n_sim=3)

# derive PCF and envelope
pcf <- dists2pcf(ds, r=0.2, r_max=25, stoyan=0.15, n_rank=1)




