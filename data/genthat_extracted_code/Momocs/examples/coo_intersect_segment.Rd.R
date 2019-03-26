library(Momocs)


### Name: coo_intersect_segment
### Title: Nearest intersection between a shape and a segment
### Aliases: coo_intersect_segment

### ** Examples

coo <- bot[1] %>% coo_center %>% coo_scale
seg <- c(0, 0, 2, 2) # passed as a numeric of length(4)
coo_plot(coo)
segments(seg[1], seg[2], seg[3], seg[4])
coo %>% coo_intersect_segment(seg) %T>% print %>%
# prints on the console and draw it
   coo[., , drop=FALSE] %>% points(col="red")

# on Coo
bot %>%
    slice(1:3) %>% # for the sake of speed
    coo_center %>%
    coo_intersect_segment(matrix(c(0, 0, 1000, 1000), ncol=2, byrow=TRUE))



