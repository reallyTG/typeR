library(CrossScreening)


### Name: sen.ci
### Title: Point estimate and confidence interval for sensitivity analysis
### Aliases: sen.ci

### ** Examples

data(lead)
d.lead <- lead$exposed[-21] - lead$control[-21]
sen.ci(d.lead, gamma = c(1, 2), alpha.up = 0, alpha.low = 0.05)




