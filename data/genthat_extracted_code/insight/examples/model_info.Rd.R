library(insight)


### Name: model_info
### Title: Access information from model objects
### Aliases: model_info

### ** Examples

library(glmmTMB)
data("Salamanders")
m <- glmmTMB(
  count ~ spp + cover + mined + (1 | site),
  ziformula = ~ spp + mined,
  dispformula = ~DOY,
  data = Salamanders,
  family = nbinom2
)

model_info(m)



