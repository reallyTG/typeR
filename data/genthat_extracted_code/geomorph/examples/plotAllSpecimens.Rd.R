library(geomorph)


### Name: plotAllSpecimens
### Title: Plot landmark coordinates for all specimens
### Aliases: plotAllSpecimens
### Keywords: visualization

### ** Examples

data(plethodon) 
Y.gpa<-gpagen(plethodon$land)    #GPA-alignment

plotAllSpecimens(Y.gpa$coords,links=plethodon$links)



