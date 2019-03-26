library(lavaan)


### Name: lavInspect
### Title: Inspect or extract information from a fitted lavaan object
### Aliases: lavInspect inspect lavTech

### ** Examples

# fit model
HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

     
fit <- cfa(HS.model, data = HolzingerSwineford1939, group = "school")

# extract information
lavInspect(fit, "sampstat")
lavTech(fit, "sampstat")



