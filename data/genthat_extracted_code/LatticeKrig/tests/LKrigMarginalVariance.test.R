
suppressMessages(library( LatticeKrig))
options( echo=FALSE)

##########################################
test.for.zero.flag<- 1
LKinfo1<- LKrigSetup( cbind( c( -1,1), c(-1,1)), NC=3,
                      nlevel=1, a.wght=4.5,alpha=1.0, normalize=FALSE)
x1<- make.surface.grid( 
  list( x= seq( -1, 1,,5), y= seq( -1,1,,5))
)

look0<-LKrig.cov( x1, LKinfo=LKinfo1,marginal =TRUE)
look<- LKrigMarginalVariance(x1, LKinfo1 )
test.for.zero( look0, look[,1])

LKinfo2<- LKrigSetup( cbind( c( -1,1), c(-1,1)), NC=3,
                      nlevel=2, a.wght=4.5,alpha=c(1.0,1.0), normalize=FALSE)

look<- LKrigMarginalVariance(x1, LKinfo2 )
look2<-LKrig.cov( x1, LKinfo=LKinfo2, marginal =TRUE)

test.for.zero( look2-look0, look[,2])
test.for.zero( look0, look[,1])


