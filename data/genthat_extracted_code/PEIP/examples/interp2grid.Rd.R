library(PEIP)


### Name: interp2grid
### Title: Bilinear and Bicubic Interpolation to Grid
### Aliases: interp2grid

### ** Examples


tx = seq(0,3,0.1)
ty = seq(0,3,0.1)

     tmat = matrix(runif(16,1,16),nrow=4)
     txin = seq(0,3,length=4)
     tyin = seq(0,3,length=4)

     bilinear1 = interp2grid(tmat,tx,ty,txin, tyin,    type=1)
     bicubic2 = interp2grid(tmat,tx,ty,txin, tyin, type=2)
     bicubic3 = interp2grid(tmat,tx,ty,txin, tyin, type=3)

    par(mfrow=c(2,2),cex=1)
             image(tmat,main='base',zlim=c(0,16),col=heat.colors(100))
             image(bilinear1,main='bilinear',zlim=c(0,16),col=heat.colors(100))
             image(bicubic2,main='bicubic2',zlim=c(0,16),col=heat.colors(100))
             image(bicubic3,main='bicubic3',zlim=c(0,16),col=heat.colors(100))
   




