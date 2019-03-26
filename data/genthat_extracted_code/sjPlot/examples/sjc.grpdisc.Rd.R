library(sjPlot)


### Name: sjc.grpdisc
### Title: Compute a linear discriminant analysis on classified cluster
###   groups
### Aliases: sjc.grpdisc

### ** Examples

# retrieve group classification from hierarchical cluster analysis
# on the mtcars data set (5 groups)
groups <- sjc.cluster(mtcars, 5)

# plot goodness of group classificatoin
sjc.grpdisc(mtcars, groups, 5)




