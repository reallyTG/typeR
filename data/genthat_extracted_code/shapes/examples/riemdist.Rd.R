library(shapes)


### Name: riemdist
### Title: Riemannian shape distance
### Aliases: riemdist
### Keywords: multivariate

### ** Examples

data(gorf.dat)
data(gorm.dat)
gorf<-procGPA(gorf.dat)
gorm<-procGPA(gorm.dat)
rho<-riemdist(gorf$mshape,gorm$mshape)
cat("Riemannian distance between mean shapes is ",rho," \n")



