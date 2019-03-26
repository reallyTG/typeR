library(Momocs)


### Name: coo_intersect_angle
### Title: Nearest intersection between a shape and a segment specified
###   with an angle
### Aliases: coo_intersect_angle coo_intersect_direction
###   coo_intersect_direction.default coo_intersect_direction.Coo

### ** Examples

coo <- bot[1] %>% coo_center %>% coo_scale
coo_plot(coo)
coo %>% coo_intersect_angle(pi/7) %>%
   coo[., , drop=FALSE] %>% points(col="red")

 # many angles
 coo_plot(coo)
 sapply(seq(0, pi, pi/12),
       function(x) coo %>% coo_intersect_angle(x)) -> ids
 coo[ids, ] %>% points(col="blue")

 coo %>%
 coo_intersect_direction("down") %>%
 coo[.,, drop=FALSE] %>% points(col="orange")




