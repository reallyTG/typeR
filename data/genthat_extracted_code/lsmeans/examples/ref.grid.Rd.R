library(lsmeans)


### Name: ref.grid
### Title: Create a reference grid from a fitted model
### Aliases: ref.grid recover.data lsm.basis summary.ref.grid lsmeans
###   contrast
### Keywords: regression models

### ** Examples

  fiber.lm <- lm(strength ~ machine + diameter, data = fiber)
  rg <- ref.grid(fiber.lm, at = list(diameter = c(20, 24, 28)))
  rg
  
  # Note this is an emmGrid object defined in emmeans. The old "ref.grid"
  # class is now an extension of this:
  r.g. <- new("ref.grid", rg)
  lsmeans(r.g., "machine")



