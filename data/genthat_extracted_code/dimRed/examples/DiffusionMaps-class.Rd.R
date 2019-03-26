library(dimRed)


### Name: DiffusionMaps-class
### Title: Diffusion Maps
### Aliases: DiffusionMaps-class DiffusionMaps

### ** Examples

dat <- loadDataSet("3D S Curve")

## use the S4 Class directly:
diffmap <- DiffusionMaps()
emb <- diffmap@fun(dat, diffmap@stdpars)

## simpler, use embed():
emb2 <- embed(dat, "DiffusionMaps")

plot(emb, type = "2vars")

samp <- sample(floor(nrow(dat) / 10))
embsamp <- diffmap@fun(dat[samp], diffmap@stdpars)
embother <- embsamp@apply(dat[-samp])
plot(embsamp, type = "2vars")
points(embother)




