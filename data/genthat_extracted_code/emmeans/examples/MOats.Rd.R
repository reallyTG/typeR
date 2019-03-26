library(emmeans)


### Name: MOats
### Title: Oats data in multivariate form
### Aliases: MOats
### Keywords: datasets

### ** Examples

MOats.lm <- lm (yield ~ Block + Variety, data = MOats)
MOats.rg <- ref_grid (MOats.lm, mult.name = "nitro")
emmeans(MOats.rg, ~ nitro | Variety)



