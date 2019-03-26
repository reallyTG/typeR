library(geomorph)


### Name: globalIntegration
### Title: Quantify global integration relative to self-similarity
### Aliases: globalIntegration
### Keywords: analysis

### ** Examples

data(plethodon) 
Y.gpa<-gpagen(plethodon$land)    #GPA-alignment    

globalIntegration(Y.gpa$coords)



