library(Momocs)


### Name: coo_samplerr
### Title: Samples coordinates (regular radius)
### Aliases: coo_samplerr

### ** Examples

stack(bot)
bot <- coo_center(bot)
stack(coo_samplerr(bot, 12))
coo_plot(bot[1])
coo_plot(rr <- coo_samplerr(bot[1], 12))
cpos <- coo_centpos(bot[1])
segments(cpos[1], cpos[2], rr[, 1], rr[, 2])

# Sometimes, interpolating may be useful:
shp <- hearts[1] %>% coo_center

# given a shp, draw segments from each points on it, to its centroid
draw_rads <- function(shp, ...){
 segments(shp[, 1], shp[, 2], coo_centpos(shp)[1], coo_centpos(shp)[2], ...)
}

# calculate the sd of argument difference in successive points,
# in other words a proxy for the homogeneity of angles
sd_theta_diff <- function(shp)
   shp %>% complex(real=.[, 1], imaginary=.[, 2]) %>%
   Arg %>% `[`(-1) %>% diff %>% sd

# no interpolation: all points are sampled from existing points but the
# angles are not equal
shp %>% coo_plot(points=TRUE, main="no interpolation")
shp %>% coo_samplerr(64) %T>% draw_rads(col="red") %>% sd_theta_diff
# with interpolation: much more homogeneous angles
shp %>% coo_plot(points=TRUE)
shp %>% coo_interpolate(360) %>% coo_samplerr(64) %T>% draw_rads(col="blue") %>% sd_theta_diff



