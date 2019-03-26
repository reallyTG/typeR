library(spacodiR)


### Name: as.spacodi
### Title: converting between data formats for community phylogenetics
### Aliases: as.spacodi

### ** Examples

# call example data from spacodiR
data(sp.example)
attach(sp.example)
spl->d.spacodi  
d.spacodi ## SPACoDi format

# convert to phylocom
as.phylocom(data=d.spacodi, picante=FALSE)->d.phylocom
d.phylocom ## phylocom format

# convert dataset to picante
as.picante(data=d.phylocom)->d.picante
d.picante ## picante format

# convert back to SPACoDi 
as.spacodi(data=d.picante)




