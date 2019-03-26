library(glmbb)


### Name: isGraphical
### Title: Hierarchical and Graphical Models
### Aliases: asGraphical isGraphical asHierarchical isHierarchical
### Keywords: misc

### ** Examples

isHierarchical(~ u * v)
isHierarchical(~ u : v)

isGraphical(~ u * v + u * w)
isGraphical(~ (u + v + w)^2)

asHierarchical(~ u:v + v:w)
asGraphical(~ (u + v + w)^2)



