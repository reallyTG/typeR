library(vegan)


### Name: ordixyplot
### Title: Trellis (Lattice) Plots for Ordination
### Aliases: ordixyplot ordisplom ordicloud panel.ordi panel.ordiarrows
###   panel.ordi3d prepanel.ordi3d ordilattice.getEnvfit
### Keywords: hplot

### ** Examples

data(dune, dune.env)
ord <- cca(dune)
## Pairs plots
ordisplom(ord)
ordisplom(ord, data=dune.env, choices=1:2)
ordisplom(ord, data=dune.env, form = ~ . | Management, groups=Manure)
## Scatter plot with polygons
ordixyplot(ord, data=dune.env, form = CA1 ~ CA2 | Management,
  groups=Manure, type = c("p","polygon"))
## Choose a different scaling
ordixyplot(ord, scaling = "symmetric")
## ... Slices of third axis
ordixyplot(ord, form = CA1 ~ CA2 | equal.count(CA3, 4),
   type = c("g","p", "polygon"))
## Display environmental variables
ordixyplot(ord, envfit = envfit(ord ~ Management + A1, dune.env, choices=1:3))
## 3D Scatter plots
ordicloud(ord, form = CA2 ~ CA3*CA1, groups = Manure, data = dune.env)
ordicloud(ord, form = CA2 ~ CA3*CA1 | Management, groups = Manure,
   data = dune.env, auto.key = TRUE, type = c("p","h"))



