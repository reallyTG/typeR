library(rotations)


### Name: gradient.search
### Title: Gradient optimization for rotation data
### Aliases: gradient.search

### ** Examples

# minimize L1 norm:
L1.error <- function(sample, Shat) {
  sum(rot.dist(sample, Shat, method = "intrinsic", p = 1))
}

cayley.sample <- ruars(n = 10, rangle = rcayley, nu = 1, space = 'SO3')
SL1 <- gradient.search(cayley.sample, L1.error, start = id.SO3)

# visually no perceptible difference between median estimates from in-built function and
# gradient based search (for almost all starting values)

## Not run: 
##D plot(cayley.sample, center=SL1$Shat, show_estimates="all")
## End(Not run)



