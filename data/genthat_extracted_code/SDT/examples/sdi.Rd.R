library(SDT)


### Name: sdi
### Title: Original and Adjusted SDI or RAI Index
### Aliases: sdi
### Keywords: attribute classes models univar

### ** Examples

## attach dataset to search path (so a variable can be accessed by name)
attach(learning_motivation)

## adjusted index computation
adj <- sdi(intrinsic, identified, introjected, external)
## first six elements of each list component vector and attributes
lapply(adj, head)
attributes(adj)

## original index computation
orig <- sdi(intrinsic, identified, introjected, external, compute.adjusted = FALSE)
lapply(orig, head)
attributes(orig)



