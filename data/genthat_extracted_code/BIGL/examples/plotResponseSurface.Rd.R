library(BIGL)


### Name: plotResponseSurface
### Title: Plot response surface
### Aliases: plotResponseSurface

### ** Examples

## Not run: 
##D   data <- subset(directAntivirals, experiment == 1)
##D   ## Data must contain d1, d2 and effect columns
##D   fitResult <- fitMarginals(data)
##D   data_mean <- aggregate(effect ~ d1 + d2, data = data[, c("d1", "d2", "effect")],
##D                          FUN = mean)
##D 
##D   ## Construct the surface from marginal fit estimates based on HSA
##D   ## model and color it by mean effect level
##D   plotResponseSurface(data, fitResult, null_model = "hsa",
##D                       colorBy = data_mean, breaks = 10^(c(0, 3, 4, 6)),
##D                       colorPalette = c("grey", "blue", "green"))
##D 
##D   ## Response surface based on Loewe additivity model and colored with
##D   ## rainbow colors. Legend will not be displayed in any case.
##D   plotResponseSurface(data, fitResult, null_model = "loewe",
##D                       colorBy = "colors", colorPalette = rainbow(6))
## End(Not run)



