library(eaf)


### Name: eafs
### Title: Exact computation of the EAF
### Aliases: eafs

### ** Examples


eaf.path <- system.file(package="eaf")

x <- read.data.sets(file.path(eaf.path, "extdata","example1_dat"))
# Compute full EAF
eafs(x[,1:2], x[,3])

# Compute only best, median and worst
eafs(x[,1:2], x[,3], percentiles = c(0, 50, 100))

x <- read.data.sets(file.path(eaf.path,"extdata","spherical-250-10-3d.txt"))
y <- read.data.sets(file.path(eaf.path,"extdata","uniform-250-10-3d.txt"))
x <- data.frame(x, group = "spherical")
x <- rbind(x, data.frame(y, group = "uniform"))

# Compute only median separately for each group
eafs(x[,1:3], sets = x[,4], groups = x[,5], percentiles = 50)




