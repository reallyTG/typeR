library(Momocs)


### Name: mosaic_engine
### Title: Plots mosaics of shapes.
### Aliases: mosaic_engine mosaic mosaic.Out mosaic.Opn mosaic.Ldk

### ** Examples


# On Out ---
bot %>% mosaic
bot %>% mosaic(~type)

# As with other grindr functions you can continue the pipe
bot %>% mosaic(~type, asp=0.5) %>% draw_firstpoint

# On Opn ---- same grammar
olea %>% mosaic(~view+var, paper_fun=paper_dots)

 # On Ldk
 mosaic(wings, ~group, pal=pal_qual_Dark2, pch=3)

 # On Out with different sizes
 # would work on other Coo too
shapes2 <- shapes
sizes <- runif(30, 1, 2)
shapes2 %>% mosaic(relatively=FALSE)
shapes2 %>% mosaic(relatively=TRUE) %>% draw_centroid()



