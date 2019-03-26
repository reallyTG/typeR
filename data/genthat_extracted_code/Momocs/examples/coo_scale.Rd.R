library(Momocs)


### Name: coo_scale
### Title: Scales coordinates
### Aliases: coo_scale coo_scale coo_scale.default coo_scale coo_scale.Coo
###   coo_scale coo_scalex coo_scale coo_scalex.default coo_scale
###   coo_scalex.Coo coo_scale coo_scaley coo_scale coo_scaley.default
###   coo_scale coo_scaley.Coo

### ** Examples

# on a single shape
b <- bot[1] %>% coo_center %>% coo_scale
coo_plot(b, lwd=2)
coo_draw(coo_scalex(b, 1.5), bor="blue")
coo_draw(coo_scaley(b, 0.5), bor="red")
# this also works on Coo objects:
stack(bot)
bot %>% coo_center %>% coo_scale %>% stack
bot %>% coo_center %>% coo_scaley(0.5) %>% stack
#equivalent to:
#bot %>% coo_center %>% coo_scalex(2) %>% stack



