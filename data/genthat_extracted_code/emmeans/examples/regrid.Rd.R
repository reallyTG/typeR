library(emmeans)


### Name: regrid
### Title: Reconstruct a reference grid with a new transformation
### Aliases: regrid

### ** Examples

pigs.lm <- lm(log(conc) ~ source + factor(percent), data = pigs)

# This will yield EMMs as GEOMETRIC means of concentrations:
emmeans(pigs.lm, "source", type = "response")
# NOTE: pairs() of the above will be RATIOS of these results

# This will yield EMMs as ARITHMETIC means of concentrations:
emmeans(regrid(ref_grid(pigs.lm, transform = "response")), "source")
# Same thing, made simpler:
emmeans(pigs.lm, "source", transform = "response")
# NOTE: pairs() of the above will be DIFFERENCES of these results



