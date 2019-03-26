library(ggtern)


### Name: geom_density_tern
### Title: Density Estimate (ggtern version)
### Aliases: geom_density_tern GeomDensityTern stat_density_tern
###   StatDensityTern
### Keywords: datasets

### ** Examples

#Plot Density Estimate, on isometric log ratio transformation of original data
data('Feldspar')
ggtern(Feldspar,aes(Ab,An,Or)) + 
 geom_density_tern(aes(color=..level..),bins=5) +
 geom_point()

#Plot Density Estimate w/ Polygon Geometry
data('Feldspar')
ggtern(data=Feldspar,aes(Ab,An,Or)) + 
    stat_density_tern(
        geom='polygon',
        aes(fill=..level..),
        bins=5,
        color='grey') +
    geom_point()
        



