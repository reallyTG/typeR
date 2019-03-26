library(shapes)


### Name: shapepca
### Title: Principal components analysis for shape
### Aliases: shapepca
### Keywords: hplot multivariate

### ** Examples

#2d example
data(gorf.dat)
data(gorm.dat)

gorf<-procGPA(gorf.dat)
gorm<-procGPA(gorm.dat)
shapepca(gorf,type="r",mag=3)
shapepca(gorf,type="v",mag=3)
shapepca(gorm,type="r",mag=3)
shapepca(gorm,type="v",mag=3)

#3D example
#data(macm.dat)
#out<-procGPA(macm.dat)
#movie
#shapepca(out,pcno=1)



