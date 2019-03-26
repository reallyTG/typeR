library(LambertW)


### Name: W_delta
### Title: Inverse transformation for heavy-tail Lambert W RVs
### Aliases: W_2delta W_2delta_2alpha W_delta W_delta_alpha deriv_W_delta
###   deriv_W_delta_alpha
### Keywords: math

### ** Examples


G_delta(0)
W_delta(0)

# W_delta is the inverse of G_delta
u.v <- -2:2
W_delta(G_delta(u.v, delta = 0.3), delta = 0.3)

# with alpha too
G_delta_alpha(u.v, delta = 1, alpha = 0.33)
W_delta_alpha(G_delta_alpha(u.v, delta = 1, alpha = 0.33), 
              delta = 1, alpha = 0.33) # the inverse




