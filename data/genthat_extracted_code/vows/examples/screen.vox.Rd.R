library(vows)


### Name: screen.vox
### Title: Screen voxels for a voxelwise smoothing object
### Aliases: screen.vox

### ** Examples


data(test)
d4 = test$d4
x = test$x
vw.obj = semipar4d(d4, formula = ~sf(x), data = data.frame(x = x), lsp=-5:5)

# Include only the first 600 voxels
sv = screen.vox(vw.obj, d4, rep(1:0, c(600,400)))



