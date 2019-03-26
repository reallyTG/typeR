library(collapsibleTree)


### Name: collapsibleTreeSummary
### Title: Create Summary Interactive Collapsible Tree Diagrams
### Aliases: collapsibleTreeSummary

### ** Examples

# Color in by number of children
collapsibleTreeSummary(warpbreaks, c("wool", "tension", "breaks"), maxPercent = 50)

# Color in by the value of breaks and use the terrain_hcl gradient
collapsibleTreeSummary(
  warpbreaks,
  c("wool", "tension", "breaks"),
  attribute = "breaks",
  fillFun = colorspace::terrain_hcl,
  maxPercent = 50
)



