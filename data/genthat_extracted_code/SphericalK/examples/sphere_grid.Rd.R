library(SphericalK)


### Name: sphere_grid
### Title: Latitude-Longitude Grids
### Aliases: sphere_grid

### ** Examples

#Spherical K function (minus CSR) with 90% confidence intervals
#for point patterns associated with 25 * 25 latitude-longitude grid

spheregrid<-sphere_grid(25)
latm<-as.vector(spheregrid$latitudes)
lonm<-as.vector(spheregrid$longitudes)
d<-seq(from=0,to=pi,by=0.3)
nd<-length(d)
d[nd]<-pi
khatsg<-sphere_khat(latm,lonm,d)
Kcisg<-sphere_montekhat(98,50,d)
plot(d,khatsg,type='n', ylim=c(-0.4,0.4),xlim=c(0,pi),xaxt = "n",
ylab = expression(K - CSR),xlab = expression("Spherical Angle"))
axis(1, at = c(0,pi/6, pi/3, pi/2, 2*pi/3, 5*pi/6, pi),
labels = expression(0,pi/6, pi/3, pi/2, 2*pi/3, 5*pi/6, pi))
polygon(c(d, rev(d)), c(Kcisg[3,], rev(Kcisg[47,])),col = "grey79", border = FALSE)
lines(d,khatsg,col = 4, lwd=2)
lines(y=c(0,0),x=c(0,pi),type='l',lty=2,lwd=2)



