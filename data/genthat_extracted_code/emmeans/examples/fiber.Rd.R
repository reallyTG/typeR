library(emmeans)


### Name: fiber
### Title: Fiber data
### Aliases: fiber
### Keywords: datasets

### ** Examples

fiber.lm <- lm(strength ~ diameter + machine, data=fiber)
ref_grid(fiber.lm)

# Covariate-adjusted means and comparisons
emmeans(fiber.lm, pairwise ~ machine)




