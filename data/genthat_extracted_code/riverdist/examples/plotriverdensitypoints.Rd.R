library(riverdist)


### Name: plotriverdensitypoints
### Title: Plot Points Used for Kernel Density
### Aliases: plotriverdensitypoints

### ** Examples

data(Gulk, fakefish)

Gulk_dens <- makeriverdensity(seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)

plotriverdensitypoints(riverdensity=Gulk_dens)



