library(SphericalK)


### Name: sphere_montekhat
### Title: K-functions Under Complete Spatial Randomness (CSR) By Monte
###   Carlo Tests
### Aliases: sphere_montekhat

### ** Examples

#Spherical K function (minus CSR) with 95% confidence intervals
#for point patterns associated with 172 upper-air monitoring stations points

data(GUAN)
latg<-GUAN[,4]
long<-GUAN[,5]
d<-seq(from=0,to=pi,by=0.1)
nd<-length(d)
d[nd]<-pi
khatsg<-sphere_khat(latg,long,d)
Kcig<-sphere_montekhat(172,16,d)
plot(d,khatsg,type='n', ylim=c(-0.1,0.15),xlim=c(0,pi),xaxt = "n",
     ylab = expression(K - CSR),xlab = expression("Spherical Angle"))
axis(1, at = c(0,pi/6, pi/3, pi/2, 2*pi/3, 5*pi/6, pi),
     labels = expression(0,pi/6, pi/3, pi/2, 2*pi/3, 5*pi/6, pi))
polygon(c(d, rev(d)), c(Kcig[2,], rev(Kcig[16,])),col = "grey79", border = FALSE)
lines(d,khatsg,col = 4, lwd=2)
lines(y=c(0,0),x=c(0,pi),type='l',lty=2,lwd=2)



