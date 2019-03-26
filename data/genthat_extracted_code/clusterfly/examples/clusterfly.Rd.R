library(clusterfly)


### Name: clusterfly
### Title: Creates a convenient data structure for dealing with a dataset
###   and a number of alternative clusterings.
### Aliases: clusterfly package-clusterfly
### Keywords: dynamic

### ** Examples

ol <- olive_example()

if (interactive()) {
ggobi(ol)
cfly_show(ol, "k4-1")
cfly_animate(ol, max = 5)
close(ol)
}



