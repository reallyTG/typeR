library(osmar)


### Name: node
### Title: Element descriptors
### Aliases: attrs node node.condition node.default osm_descriptors refs
###   relation relation.condition relation.default tags way way.condition
###   way.default

### ** Examples

## Description by ID (*.default):
  node(1)
way(1)
relation(1)
## Description by condition (*.condition):
  node(tags(v == "Marienplatz"))
## Description by condition (*.condition):
  way(attrs(id == 17458))



