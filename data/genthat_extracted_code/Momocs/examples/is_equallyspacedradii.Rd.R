library(Momocs)


### Name: is_equallyspacedradii
### Title: Tests if coordinates likely have equally spaced radii
### Aliases: is_equallyspacedradii

### ** Examples

bot[1] %>% is_equallyspacedradii
bot[1] %>% coo_samplerr(36) %>% is_equallyspacedradii
# higher tolerance but wrong
bot[1] %>% coo_samplerr(36) %>% is_equallyspacedradii(thres=5*2*pi/360)
# coo_interpolate is a better option
bot[1] %>% coo_interpolate(1200) %>% coo_samplerr(36) %>% is_equallyspacedradii
# Coo method
bot %>% coo_interpolate(360) %>% coo_samplerr(36) %>% is_equallyspacedradii



