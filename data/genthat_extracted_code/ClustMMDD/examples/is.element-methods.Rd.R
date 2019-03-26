library(ClustMMDD)


### Name: is.element-methods
### Title: Check if a 'modelKS' object is in a set of such objects.
### Aliases: is.element-methods is.element

### ** Examples

data(exModelKS)
is.element(c(exModelKS), c(exModelKS))
is.element(c(exModelKS, 1, c(1:5)), c(exModelKS))
is.element(c(exModelKS), c(exModelKS, 1, list(1:5, 0)))



