library(Momocs)


### Name: sfourier
### Title: Radii variation Fourier transform (equally spaced curvilinear
###   abscissa)
### Aliases: sfourier sfourier.default sfourier.Out

### ** Examples

molars[4] %>%
coo_center %>% coo_scale %>% coo_interpolate(1080) %>%
coo_slidedirection("right") %>%
   coo_sample(360) %T>% coo_plot(zoom=2) %>%
   sfourier(16) %>%
   sfourier_i() %>%
   coo_draw(bor="red", points=TRUE)



