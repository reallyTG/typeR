library(tempR)


### Name: plot_pca.trajectories
### Title: Plot trajectories based on Temporal Check-All-That-Apply (TCATA)
###   data
### Aliases: plot_pca.trajectories

### ** Examples

# example using 'syrah' data set
syrah.pca <- prcomp(syrah[1:248, -c(1:4)], scale. = FALSE)
plot_pca.trajectories(syrah.pca, products.times = syrah[1:248, c(1, 4)],
                      attributes = colnames(syrah)[-c(1:4)], type = "raw")

# now with smoothing; may need to play with the span parameter to get appropriate smoothing
plot_pca.trajectories(syrah.pca, products.times = syrah[1:248, c(1, 4)],
                      attributes = colnames(syrah)[-c(1:4)], type = "smooth", span = 0.3)

# plots at each time point (trajectories join 2 points so start at timepoint 2, i.e., 11 s)
x <- 11:14 # for brevity show only the first 4 timeslices
# x <- 11:41 # uncomment this line to to run a longer demo
pca.list <- list()
for(i in seq_along(x)){
  pca.list[[x[i]-10]] <- syrah.pca
  pca.list[[x[i]-10]]$x <- pca.list[[x[i]-10]]$x[1:((x[i]-9)*6), ]
  plot_pca.trajectories(pca.list[[x[i]-10]], products.times = syrah[1:((x[i]-9)*6), c(1, 4)],
                        attributes = colnames(syrah)[-c(1:4)], type = "raw", inflate.factor = 1.5)
  Sys.sleep(3/4)
  # save plot if saving stills for a video; see Castura, Baker, & Ross (2016, Video 1)
}




