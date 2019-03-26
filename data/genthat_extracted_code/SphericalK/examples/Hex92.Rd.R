library(SphericalK)


### Name: Hex92
### Title: Global Hexagonal Grids
### Aliases: Hex92
### Keywords: datasets

### ** Examples

#Spherical K function (minus CSR) with 90% confidence intervals
#for point patterns associated with 92 points global hexagonal grid

data(Hex92)
lath92<-Hex92[,3]
lonh92<-Hex92[,2]
d<-seq(from=0,to=pi,by=0.35)
nd<-length(d)
d[nd]<-pi
khatsh92<-sphere_khat(lath92,lonh92,d)
Kcih92<-sphere_montekhat(92,50,d)
plot(d,khatsh92,type='n', ylim=c(-0.4,0.4),xlim=c(0,pi),xaxt = "n",
     ylab = expression(K - CSR),xlab = expression("Spherical Angle"))
axis(1, at = c(0,pi/6, pi/3, pi/2, 2*pi/3, 5*pi/6, pi),
     labels = expression(0,pi/6, pi/3, pi/2, 2*pi/3, 5*pi/6, pi))
polygon(c(d, rev(d)), c(Kcih92[3,], rev(Kcih92[47,])),col = "grey79", border = FALSE)
lines(d,khatsh92,col = 4, lwd=2)
lines(y=c(0,0),x=c(0,pi),type='l',lty=2,lwd=2)


