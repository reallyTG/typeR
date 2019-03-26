library(geophys)


### Name: dofry
### Title: Fry Estimation
### Aliases: dofry
### Keywords: misc

### ** Examples


RDAT = randFRY(400, LIM=c(0,0, 200, 200) , rlen=5   )
length(RDAT$x)
plot(RDAT$x, RDAT$y, asp=1, pch=".", cex=2)
flag = sqrt( (RDAT$x-mean(RDAT$x))^2  + (RDAT$y-mean(RDAT$y))^2)<75

DAT = list(x=RDAT$x[flag], y=RDAT$y[flag])
 x = DAT$x
    y = DAT$y
 plot(x,y, asp=1, pch=21, col='red', bg='gold', ann=FALSE, axes=FALSE)

FF = dofry(DAT$x, DAT$y )
AF = plotfry(FF, dis=30)

Z = xtractlip(AF)

lines(cluster::predict.ellipsoid(Z$hull), col='red')  
   







