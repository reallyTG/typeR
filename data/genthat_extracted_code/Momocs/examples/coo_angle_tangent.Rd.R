library(Momocs)


### Name: coo_angle_tangent
### Title: Calculates the tangent angle along the perimeter of a shape
### Aliases: coo_angle_tangent coo_angle_tangent.default
###   coo_angle_tangent.Coo coo_tangle

### ** Examples

b <- bot[1]
phi  <- coo_angle_tangent(b)
phi2 <- coo_angle_tangent(coo_smooth(b, 2))
plot(phi, type='l')
plot(phi2, type='l', col='red') # ta is very sensible to noise

# on Coo
bot %>% coo_angle_tangent



