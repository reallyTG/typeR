suppressMessages(library(LatticeKrig))

#######################################################
# Define two useful predict functions. 
#######################################################
predict.surfaceGrid<- function(object,x){
  interp.surface( object, x)
}
# this is a simple function that just returns the constant value
# object$value
predict.CONSTANT<- function(object,x){
  rep( object$value, nrow(x))
}
### first compare the stationsry case to its equivalent parameterization as
### a nonstationary model but where parameters are constant. 

############# 1-d case first

a.wghtObject<- list(value = 4.5)
class( a.wghtObject )<-"CONSTANT"

alphaTemp<-c(.75, .2, .05)
alphaObject<- NULL
for( k in 1:3){
  temp<- list( value = alphaTemp[k])
  class( temp )<-"CONSTANT"
  alphaObject<- c( alphaObject, list( temp))
}

LKinfo0<- LKrigSetup( rbind(-1,1), NC=4,
                      LKGeometry="LKInterval",
                      nlevel=3, a.wght=4.5, alpha=alphaTemp )
#NOTE can reuse predict objects because they are constants not related to 
# locations
LKinfoTEST1<- LKrigSetup( rbind(-1,1), NC=4,
                          LKGeometry="LKInterval",
                          nlevel=3, 
                          a.wghtObject = a.wghtObject,
                          alphaObject = alphaObject ) 
xGrid<- cbind(seq( -1,1,length.out= 20))
for( k in 1:3){
  s0<-  spind2full(LKrigSAR( LKinfo0, k))
  s1<-  spind2full(LKrigSAR( LKinfoTEST1, k))
  test.for.zero( s0,s1, tag="1-d SAR Levels")
}
p0<- LKrig.precision( LKinfo0)       
p1<- LKrig.precision( LKinfoTEST1)
test.for.zero( p0@entries, p1@entries, tag="1-d SAR Precision")

############# 2-d case


# spatial domain    
sDomain<- rbind( c(-1,-1),
                 c(1,1))

alphaTemp<-c(.75, .2, .05)
alphaTemp<-rep( 1, 3)
# To get started compare stationary model specified two ways
LKinfo0<- LKrigSetup( sDomain, NC=3,
                      NC.buffer=2,
                      nlevel=3, a.wght=4.5, alpha=alphaTemp )
a.wghtObject<- list(value = 4.5)
class( a.wghtObject )<-"CONSTANT"


alphaObject<- NULL
for( k in 1:3){
  temp<- list( value = alphaTemp[k])
  class( temp )<-"CONSTANT"
  alphaObject<- c( alphaObject, list( temp))
}
LKinfoTEST1<- LKrigSetup( sDomain,  NC=3, nlevel=3,
                          NC.buffer=2,
                          a.wghtObject = a.wghtObject,
                          alpha = alphaTemp )
LKinfoTEST2<- LKrigSetup( sDomain,  NC=3, nlevel=3,
                          NC.buffer=2,
                          a.wghtObject = a.wghtObject,
                          alphaObject = alphaObject )

p0<- LKrig.precision( LKinfo0)       
p1<- LKrig.precision( LKinfoTEST1)
p2<- LKrig.precision( LKinfoTEST2) 
test.for.zero( p0@entries, p1@entries, tag="2-d precision alpha constant")
test.for.zero( p1@entries, p2@entries, tag="2-d precision alphaObject")

b0<- LKrig.basis( rbind( c(.2,.8)), LKinfo0)
b1<- LKrig.basis( rbind( c(.2,.8)), LKinfoTEST1)
b2<- LKrig.basis( rbind( c(.2,.8)), LKinfoTEST2)
test.for.zero( b0,b1, tag="2-d basis alpha constant")
test.for.zero( b1,b2,tag="2-d basis alphaObject")


