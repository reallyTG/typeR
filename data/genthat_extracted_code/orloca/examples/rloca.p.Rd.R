library(orloca)


### Name: rloca.p
### Title: Random instances generator of loca.p class object
### Aliases: rloca.p
### Keywords: datagen

### ** Examples

# A random loca.p object at unit square with 5 demand points
rloca.p(5)
# At another region
rloca.p(10, xmin=-2, xmax=2, ymin=-2, ymax=2)
# Five groups
rloca.p(48, groups=5)
# Three unequal groups
rloca.p(1, groups=c(10, 7, 2))



