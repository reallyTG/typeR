library(emmeans)


### Name: emtrends
### Title: Estimated marginal means of linear trends
### Aliases: emtrends

### ** Examples

fiber.lm <- lm(strength ~ diameter*machine, data=fiber)
# Obtain slopes for each machine ...
( fiber.emt <- emtrends(fiber.lm, "machine", var = "diameter") )
# ... and pairwise comparisons thereof
pairs(fiber.emt)

# Suppose we want trends relative to sqrt(diameter)...
emtrends(fiber.lm, ~ machine | diameter, var = "sqrt(diameter)", 
         at = list(diameter = c(20, 30)))




