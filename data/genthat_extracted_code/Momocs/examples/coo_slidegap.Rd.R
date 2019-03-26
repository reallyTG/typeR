library(Momocs)


### Name: coo_slidegap
### Title: Slides coordinates using the widest gap
### Aliases: coo_slidegap

### ** Examples

cat <- coo_center(shapes[4])
coo_plot(cat)

# we only retain the bottom of the cat
cat_down <- coo_down(cat, slidegap=FALSE)

# see? the segment on the x-axis coorespond to the widest gap.
coo_plot(cat_down)

# that's what we meant
coo_plot(coo_slidegap(cat_down))



