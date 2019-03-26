library(TeachingDemos)


### Name: faces
### Title: Chernoff Faces
### Aliases: faces
### Keywords: hplot

### ** Examples

faces(rbind(1:3,5:3,3:5,5:7))

data(longley)
faces(longley[1:9,])

set.seed(17)
faces(matrix(sample(1:1000,128,),16,8),main="random faces")

if(interactive()){
  tke1 <- rep( list(list('slider',from=0,to=1,init=0.5,resolution=0.1)), 15)
  names(tke1) <- c('FaceHeight','FaceWidth','FaceShape','MouthHeight',
	'MouthWidth','SmileCurve','EyesHeight','EyesWidth','HairHeight',
	'HairWidth','HairStyle','NoseHeight','NoseWidth','EarWidth','EarHeight')
  tkfun1 <- function(...){
	tmpmat <- rbind(Min=0,Adjust=unlist(list(...)),Max=1)
	faces(tmpmat, scale=FALSE)
  }

  tkexamp( tkfun1, list(tke1), plotloc='left', hscale=2, vscale=2 )
}





