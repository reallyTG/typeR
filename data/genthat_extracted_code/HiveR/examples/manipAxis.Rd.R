library(HiveR)


### Name: manipAxis
### Title: Modify the Display of Axes and Nodes in a Hive Plot
### Aliases: manipAxis
### Keywords: utilities

### ** Examples


data(HEC)
# The first 3 examples take advantage of the argument '...'
# in plotHive, which passes action through to manipAxis on the fly.
# For this particular data, norm and absolute scaling appear the same.

plotHive(HEC, bkgnd = "white") # default is absolute positioning of nodes
plotHive(HEC, method = "rank", bkgnd = "white")
plotHive(HEC, method = "norm", bkgnd = "white")

# In these examples, we'll explicitly use manipAxis and then plot
# in a separate step.  This is because trying to plot on the fly in
# these cases will result in absolute scaling (which we do use here,
# but one might not want to be forced to do so).

HEC2 <- manipAxis(HEC, method = "invert", action = c(-1, 1))
plotHive(HEC2, bkgnd = "white")
HEC3 <- manipAxis(HEC, method = "stretch", action = c(2,3))
plotHive(HEC3, bkgnd = "white")
HEC4 <- manipAxis(HEC, method = "offset", action = c(0, 1.5))
plotHive(HEC4, bkgnd = "white")




