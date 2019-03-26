library(mlr)


### Name: createSpatialResamplingPlots
### Title: Create (spatial) resampling plot objects.
### Aliases: createSpatialResamplingPlots

### ** Examples

## No test: 
rdesc = makeResampleDesc("SpRepCV", folds = 5, reps = 4)
r = resample(makeLearner("classif.qda"), spatial.task, rdesc)

##-------------------------------------------------------------
## single unnamed resample input with 5 folds and 2 repetitions
##-------------------------------------------------------------

plots = createSpatialResamplingPlots(spatial.task, r, crs = 32717,
  repetitions = 2, x.axis.breaks = c(-79.065, -79.085),
  y.axis.breaks = c(-3.970, -4))
cowplot::plot_grid(plotlist = plots[["Plots"]], ncol = 5, nrow = 2,
  labels = plots[["Labels"]])

##--------------------------------------------------------------------------
## single named resample input with 5 folds and 1 repetition and 32717 datum
##--------------------------------------------------------------------------

plots = createSpatialResamplingPlots(spatial.task, list("Resamp" = r),
  crs = 32717, datum = 32717, repetitions = 1)
cowplot::plot_grid(plotlist = plots[["Plots"]], ncol = 5, nrow = 1,
  labels = plots[["Labels"]])

##-------------------------------------------------------------
## multiple named resample inputs with 5 folds and 1 repetition
##-------------------------------------------------------------

rdesc1 = makeResampleDesc("SpRepCV", folds = 5, reps = 4)
r1 = resample(makeLearner("classif.qda"), spatial.task, rdesc1)
rdesc2 = makeResampleDesc("RepCV", folds = 5, reps = 4)
r2 = resample(makeLearner("classif.qda"), spatial.task, rdesc2)

plots = createSpatialResamplingPlots(spatial.task,
  list("SpRepCV" = r1, "RepCV" = r2), crs = 32717, repetitions = 1,
  x.axis.breaks = c(-79.055, -79.085), y.axis.breaks = c(-3.975, -4))
cowplot::plot_grid(plotlist = plots[["Plots"]], ncol = 5, nrow = 2,
  labels = plots[["Labels"]])

##-------------------------------------------------------------------------------------
## Complex arrangements of multiple named resample inputs with 5 folds and 1 repetition
##-------------------------------------------------------------------------------------

p1 <- plot_grid(plist[["Plots"]][[1]], plist[["Plots"]][[2]],
  plist[["Plots"]][[3]], ncol = 3, nrow = 1, labels = plist[["Labels"]][1:3],
  label_size = 18)
p12 <- plot_grid(plist[["Plots"]][[4]], plist[["Plots"]][[5]], ncol = 2,
   nrow = 1, labels = plist[["Labels"]][4:5], label_size = 18)

p2 <- plot_grid(plist[["Plots"]][[6]], plist[["Plots"]][[7]],
  plist[["Plots"]][[8]], ncol = 3, nrow = 1, labels = plist[["Labels"]][6:8],
  label_size = 18)
p22 <- plot_grid(plist[["Plots"]][[9]], plist[["Plots"]][[10]], ncol = 2,
  nrow = 1, labels = plist[["Labels"]][9:10], label_size = 18)

cowplot::plot_grid(p1, p12, p2, p22, ncol = 1)
## End(No test)



