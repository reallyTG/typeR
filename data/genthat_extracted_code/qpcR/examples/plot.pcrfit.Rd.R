library(qpcR)


### Name: plot.pcrfit
### Title: Plotting qPCR data with fitted curves
### Aliases: plot.pcrfit
### Keywords: models nonlinear

### ** Examples

## Single plot.
m1 <- pcrfit(reps, 1, 2, l5)
plot(m1)

## Add another plot in blue.
m2 <- pcrfit(reps, 1, 12, l5)
plot(m2, add = TRUE, col = 4)

## Plot a 'modlist' batch with coloring of replicates.
ml1 <- modlist(reps, 1, 2:13, model = l4)
plot(ml1, col = gl(3,4))   

## Subset of cycle range.
plot(ml1, col = rep(1:3, each = 4), 
     par2D = list(xlim = c(10, 30)))

## Plot single curves for diagnostics.
plot(ml1, type = "single", col = rep(1:3, each = 4))

## 3D plots of 'modlist's.
plot(ml1, type = "3D", col = rep(1:3, each = 4))
rgl.close()

## Not run: 
##D ## Example for "image" type when
##D ## using large data.
##D ml2 <- modlist(vermeulen2)
##D plot(ml2, type = "image")
##D 
##D ## Example for outlier identification:
##D ## RED/*name* indicates failed fitting,
##D ## BLUE/**name** indicates sigmoidal outlier
##D ## using 'testdat' set.
##D ml3 <- modlist(testdat, model = l5)
##D plot(ml3, type = "single") 
## End(Not run)



