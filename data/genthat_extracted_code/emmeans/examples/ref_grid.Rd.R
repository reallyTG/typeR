library(emmeans)


### Name: ref_grid
### Title: Create a reference grid from a fitted model
### Aliases: ref_grid

### ** Examples

fiber.lm <- lm(strength ~ machine*diameter, data = fiber)
ref_grid(fiber.lm)
summary(.Last.ref_grid)

ref_grid(fiber.lm, at = list(diameter = c(15, 25)))

## Not run: 
##D # We could substitute the sandwich estimator vcovHAC(fiber.lm)
##D # as follows:
##D summary(ref_grid(fiber.lm, vcov. = sandwich::vcovHAC))
## End(Not run)

# If we thought that the machines affect the diameters
# (admittedly not plausible in this example), then we should use:
ref_grid(fiber.lm, cov.reduce = diameter ~ machine)

# Multivariate example
MOats.lm = lm(yield ~ Block + Variety, data = MOats)
ref_grid(MOats.lm, mult.names = "nitro")
# Silly illustration of how to use 'mult.levs' to make comb's of two factors
ref_grid(MOats.lm, mult.levs = list(T=LETTERS[1:2], U=letters[1:2]))




