library(shapes)


### Name: ssriemdist
### Title: Riemannian size-and-shape distance
### Aliases: ssriemdist
### Keywords: multivariate

### ** Examples

data(gorf.dat)
data(gorm.dat)
gorf<-procGPA(gorf.dat,scale=FALSE)
gorm<-procGPA(gorm.dat,scale=FALSE)
ds<-ssriemdist(gorf$mshape,gorm$mshape)
cat("Riemannian size-and-shape distance between mean size-and-shapes is ",ds," \n")



