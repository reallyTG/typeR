library(compositions)


### Name: kingTetrahedron
### Title: Ploting composition into rotable tetrahedron
### Aliases: kingTetrahedron
### Keywords: dynamic

### ** Examples

data(SimulatedAmounts)
dat <- acomp(sa.groups5)
hc <- hclust(dist(dat), method = "complete")  # data are clustered 
kingTetrahedron(dat,parts=1:4, file="myfirst.kin", clu=cutree(hc,7),
scale=0.2)
# the 3-D plot is written into Glac1.kin file to be displayed with KiNG viewer. 
# The seven clusters partition is notated with different colors of points.



