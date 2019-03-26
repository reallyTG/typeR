library(lsbclust)


### Name: plot.ovl.kmeans
### Title: Plot method for class 'ovl.kmeans'
### Aliases: plot.ovl.kmeans
### Keywords: hplot

### ** Examples

data("dcars")
m <- orc.lsbclust(data = dcars, margin = 3, delta = c(1,1,1,1), nclust = 5, type = "overall")
plot(m)



