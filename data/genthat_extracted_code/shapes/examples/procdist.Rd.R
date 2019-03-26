library(shapes)


### Name: procdist
### Title: Procrustes distance
### Aliases: procdist
### Keywords: multivariate

### ** Examples

data(gorf.dat)
data(gorm.dat)
gorf<-procGPA(gorf.dat)
gorm<-procGPA(gorm.dat)
distfull<-procdist(gorf$mshape,gorm$mshape)
cat("Full Procustes distance between mean shapes is ",distfull," \n")



