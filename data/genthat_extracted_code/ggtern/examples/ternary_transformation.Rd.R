library(ggtern)


### Name: ternary_transformation
### Title: Ternary / Cartesian Transformation
### Aliases: ternary_transformation tlr2xy xy2tlr

### ** Examples

data(Feldspar)
dfm = plyr::rename(Feldspar,c("Ab"="x","An"="y","Or"="z"))
crd = coord_tern()
fwd = tlr2xy(dfm,crd)
rev = tlr2xy(fwd,crd,inverse = TRUE)



