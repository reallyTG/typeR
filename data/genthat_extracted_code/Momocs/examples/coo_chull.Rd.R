library(Momocs)


### Name: coo_chull
### Title: Calculates the (recursive) convex hull of a shape
### Aliases: coo_chull coo_chull coo_chull.default coo_chull coo_chull.Coo
###   coo_chull coo_chull_onion coo_chull coo_chull_onion.default coo_chull
###   coo_chull_onion.Coo

### ** Examples

# coo_chull
h <- coo_sample(hearts[4], 32)
coo_plot(h)
ch <- coo_chull(h)
lines(ch, col='red', lty=2)

bot %>% coo_chull

coo_chull_onion
x <- bot %>% efourier(6) %>% PCA
all_whisky_points <- x %>% as_df() %>% filter(type=="whisky") %>% select(PC1, PC2)
plot(x, ~type, eig=FALSE)
peeling_the_whisky_onion <- all_whisky_points %>% as.matrix %>% coo_chull_onion()
# you may need to par(xpd=NA) to ensure all segments
# even those outside the graphical window are drawn
peeling_the_whisky_onion$coo %>% lapply(coo_draw)
# simulated data
xy <- replicate(2, rnorm(50))
coo_plot(xy, poly=FALSE)
xy %>% coo_chull_onion() %$% coo %>%
lapply(polygon, col="#00000022")



