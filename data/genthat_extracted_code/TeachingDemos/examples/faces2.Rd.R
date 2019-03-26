library(TeachingDemos)


### Name: faces2
### Title: Chernoff Faces
### Aliases: faces2 face2.plot
### Keywords: hplot

### ** Examples

  faces2(matrix( runif(18*10), nrow=10), main='Random Faces')

if(interactive()){
  tke2 <- rep( list(list('slider',from=0,to=1,init=0.5,resolution=0.1)), 18)
  names(tke2) <- c('CenterWidth','TopBottomWidth','FaceHeight','TopWidth',
	'BottomWidth','NoseLength','MouthHeight','MouthCurve','MouthWidth',
	'EyesHeight','EyesBetween','EyeAngle','EyeShape','EyeSize','EyeballPos',
	'EyebrowHeight','EyebrowAngle','EyebrowWidth')
  tkfun2 <- function(...){
	tmpmat <- rbind(Min=0,Adjust=unlist(list(...)),Max=1)
	faces2(tmpmat, scale='none')
  }

  tkexamp( tkfun2, list(tke2), plotloc='left', hscale=2, vscale=2 )
}



