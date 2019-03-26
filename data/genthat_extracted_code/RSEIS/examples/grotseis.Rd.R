library(RSEIS)


### Name: grotseis
### Title: Get seismic rotation matrix
### Aliases: grotseis
### Keywords: misc

### ** Examples


####  simple case:


vecs  <- rbind(c(0,0,1), c(0,1,0))
rbaz <- grotseis(21.76, flip=FALSE) 
bvec  <- vecs %*%  rbaz

plot(c(-2,2) , c(-2,2) , asp=1, xaxs="r"  , yaxs="r" , type='n' )

  arrows(0, 0, 0+bvec[,2], 0+bvec[,3],
     col=c("red", "blue"), length=.08)
     
  arrows(0, 0, vecs[,2], vecs[,3],
     col=c("red", "blue"), length=.08, lty=2)

text(0+bvec[1,2], 0+bvec[1,3], labels='radial', pos=3)
text(0+bvec[2,2], 0+bvec[2,3], labels='transverse', pos=4)

text(0+vecs[1,2], 0+vecs[1,3], labels='North', pos=3)
text(0+vecs[2,2], 0+vecs[2,3], labels='East', pos=4)

 
####  realistic case:
STAXY<-list()

STAXY$'x'<-c(-2.9162198461534,-2.49599248511068,
-2.85909405321704,-1.96135073099434,
-6.50413342506259,2.64026676599765,
-3.95701139503518,-2.84082134537436,
-0.0457817300378462,-2.74214190991955)
STAXY$'y'<-c(-7.83435541676815,-4.46180337254565,
-6.46036190991833,-5.01212763828746,
-2.56091416028758,
5.31173503708142,2.10545324503380,-0.87490923667824,
-0.172422188354707,-1.52055218789877)

STAXY$'lat'<-c(14.685621984127,14.7159182222222,
14.6979647030651,14.710975070028,
14.7329873333333,14.8037143111518
,14.7749104943935,14.7481391460905,
14.7544511215933,14.7423394025875)

STAXY$'lon'<-c(268.420918730159,268.424817925926,
268.421447725096,268.429783940243,268.387586722222,
268.472531954619,268.41123843527,268.421611351166,
268.447574716981,268.422528671994)

STAXY$'z'<-c(0.92522857142857,1.48225333333333,
1.14740517241379,1.4423781512605,1.51148,
2.53268681318681,2.70014678899083,2.04094444444444,
2.90827547169811,2.31817123287671)

STAXY$'cen'<-c(14.756,-91.552)

STAXY$name<-c('OBS','CAR','MAR','CAS','MTB','STA','STE','MOT','SUM','DOM')
sguitoXY<-list()
sguitoXY$'x'<-c(-1.78551922571555)
sguitoXY$'y'<-c(-1.80850340813817)
sguitoXY$'lat'<-c(14.7397535236)
sguitoXY$'lon'<-c(268.4314147874)
sguitoXY$'z'<-c(2.501)

DAZ <- rdistaz( sguitoXY$lat, sguitoXY$lon ,       STAXY$lat, STAXY$lon)

STAXY$az <- DAZ$baz

####  plotting
plot(STAXY$x, STAXY$y, asp=1, xaxs="r"  , yaxs="r" )
text(STAXY$x, STAXY$y,STAXY$name, pos=3)
points(0,0, pch=3)
points(sguitoXY$x,sguitoXY$y , pch=8)
segments(sguitoXY$x, sguitoXY$y, STAXY$x, STAXY$y, col="green", lty=2)

#### be aware of the convention used: (V-N-E) or (V-E-N)
### here first vector is east, second vector is north
###       if you use the V-N-E convention
vecs  <- rbind( c(0,1,0), c(0,0,1))

for( i in 1:length(STAXY$x))
  {
rbaz <- grotseis(STAXY$az[i], flip=FALSE)
bvec  <- vecs %*%  rbaz
##############   red is north, blue east
########         red is radial positive away or toward  source, blue is transverse
##########       blue is positive rotated to the right of red
##
arrows(STAXY$x[i],STAXY$y[i], STAXY$x[i]+bvec[,2], STAXY$y[i]+bvec[,3],
col=c("red", "blue"), length=.08)

}









