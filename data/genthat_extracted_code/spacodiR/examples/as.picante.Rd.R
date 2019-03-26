library(spacodiR)


### Name: as.picante
### Title: converting between data formats for community phylogenetics
### Aliases: as.picante

### ** Examples

# call example data from SPACoDi
data(sp.example)
attach(sp.example)
spl->d.spacodi  
d.spacodi ## SPACoDi format

# convert to phylocom
as.phylocom(data=spl, picante=FALSE)->d.phylocom
d.phylocom ## phylocom format

# convert dataset to picante
as.picante(data=d.phylocom)->d.picante
d.picante ## picante format

# convert back to SPACoDi 
as.spacodi(data=d.picante)

# run standardized effect size mean nearest taxon distances in picante
ses.mntd(as.picante(spl), cophenetic(phy))




