library(magicaxis)


### Name: magproj
### Title: Magic longitude / latitude projection function
### Aliases: magproj magprojgrid magprojlabels
### Keywords: projection map

### ** Examples

# GAMA fields:
par(mar=c(0.1,0.1,0.1,0.1))
magproj(c(129,141), c(-2,3), type='b', projection='aitoff', centre=c(180,0),
fliplong=TRUE, labloc=c(90,-45), col='red', labeltype = 'sex', crunch=TRUE)
magproj(c(211.5,223.5), c(-2,3), col='red', add=TRUE)
magproj(c(30.2,38.8), c(-10.25,-3.72), col='red', add=TRUE)
magproj(c(30.2,38.8), -6, type='l', add=TRUE, col='grey')
magproj(c(339,351), c(-35,-30), col='red', add=TRUE)

magecliptic(width=10,col=hsv(1/12,alpha=0.3),border=NA)
magecliptic(width=0,col='orange')
magMWplane(width=20,col=hsv(v=0,alpha=0.1),border=NA)
magMWplane(width=0,col='darkgrey')
magMW(pch=16, cex=2, col='darkgrey')
magsun(c(7,26), pch=16, cex=2, col='orange2') #An important date!

magproj(c(174,186), c(-3,2), col='red', add=TRUE)

#Plus SDSS:
magproj(c(110,260), c(-4,70), border='blue', add=TRUE)

magproj(c(35,135,180,217.5,345), c(-3.72,3,2,3,-30)+10, type='t',
plottext=c('G02','G09','G12','G15','G23'), add=TRUE)

legend('topleft', legend=c('GAMA Regions','SDSS Main Survey'), col=c('red','blue'),
pch=c(15,NA), lty=c(NA,1), bty='n')
legend('topright', legend=c('Ecliptic','MW Plane'), col=c(hsv(c(1/12,0), v=c(1,0),
alpha=0.5)), pch=c(15,15), lty=c(1,1), bty='n')
legend('bottomleft', legend=c('Sun', 'MW Centre'), col=c('orange2','darkgrey'), pch=16,
bty='n')



