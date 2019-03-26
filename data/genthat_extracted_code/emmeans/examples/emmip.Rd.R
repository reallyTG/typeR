library(emmeans)


### Name: emmip
### Title: Interaction-style plots for estimated marginal means
### Aliases: emmip emmip.default

### ** Examples

#--- Three-factor example
noise.lm = lm(noise ~ size * type * side, data = auto.noise)

# Separate interaction plots of size by type, for each side
emmip(noise.lm, type ~ size | side)

# One interaction plot, using combinations of size and side as the x factor
# ... with added confidence intervals
emmip(noise.lm, type ~ side * size, CIs = TRUE)

# One interaction plot using combinations of type and side as the trace factor
emmip(noise.lm, type * side ~ size)

# Individual traces in panels
emmip(noise.lm, ~ size | type * side)




