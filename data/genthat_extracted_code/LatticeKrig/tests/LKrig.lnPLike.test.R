# LatticeKrig
# Copyright 2004-2011, Institute for Mathematics Applied Geosciences
# University Corporation for Atmospheric Research
# Licensed under the GPL -- www.gpl.org/licenses/gpl.html

suppressMessages(library( LatticeKrig))
options( echo=FALSE)


# tests for computing the determinant and quad form
  test.for.zero.flag<- 1
  alpha<- c(1,.5,.5)
  nlevel<-3
# in order to give different a.wght by level this should be in the 
# form of a list with each value (not just a vector)
  a.wght<-list(5,5,10)
  lnDet<- function(A){
  sum( log( eigen( A, symmetric=TRUE)$values))}

  data( ozone2)

  x<-ozone2$lon.lat[1:20,]
  y<- ozone2$y[16,1:20]
  good <-  !is.na( y)
  x<- x[good,]
  y<- y[good]
#x<- transformx(x, "range")
  N<- length( y)
  lambda <- .8
 set.seed(123)
  weights<- runif(N)
  W<- diag(weights)
# a micro sized lattice so determinant is not too big or small
#  obj<- LKrig( x,y,NC=5, weights= weights, lambda=lambda,
#               nlevel=nlevel,alpha=alpha,a.wght=a.wght,
#                              NtrA=5,iseed=122)
  
 
  LKinfo<- LKrigSetup( x,NC=5, lambda=lambda,
                       nlevel=nlevel,alpha=alpha,a.wght=a.wght,
                       fixedFunctionArgs = list(m = 2))
  obj<- LKrig( x,y,LKinfo=LKinfo, weights= weights, NtrA=5,iseed=122)
  
# The equivalent Kriging using mKrig and the LatticeKrig covariance function
  obj0<- mKrig( x,y, weights= weights, lambda=lambda, m=2, cov.function="LKrig.cov",
                                 cov.args=list(LKinfo=LKinfo),
                                 NtrA=5, iseed=122)
# quick up front test of likelihood computation
# This is only valid if mKrig is computating the likelihood correctly ;-).  

  test.for.zero( obj$lnProfileLike.FULL,obj0$lnProfileLike.FULL, 
                 tag="lnProfileFULL from LKrig and identical compuation
                 using mKrig")
  

###### check of formula with weights
  PHI<- as.matrix(LKrig.basis( x,LKinfo))
  Q <- as.matrix(LKrig.precision(LKinfo))
  M1<- PHI%*%solve( Q)%*%t(PHI) +  lambda*solve( W) 
  B1<- (t(PHI)%*%(W/lambda)%*%PHI + Q)
  B2<- (1/lambda) * ( t(PHI)%*%(W)%*%PHI + lambda*Q)
  B3<-  t(PHI)%*%(W)%*%PHI + lambda*Q
  N2<- nrow(Q)
#  lnDet( M1)
#  lnDet( B1) - lnDet(Q) - lnDet( W/lambda)
#  lnDet( B2) - lnDet(Q) - lnDet( W/lambda)
  test.for.zero( lnDet( B3) - lnDet(Q) - sum( log( weights))  + (N-N2)*log(lambda),
                         lnDet( M1), tag="Direct formula")
  test.for.zero( obj$lnDetCov,  obj0$lnDetCov, tag= "lnDetCov for mKrig and LatticeKrig")
  test.for.zero( obj$quad.form,  obj0$quad.form, tag= "quadratic forms for rho MLE")
  test.for.zero( obj0$lnProfileLike, obj$lnProfileLike,
                                tag="Profile Likelihood concentrated on lambda" )
  
  # with replicated fields -- first pass including if LKrigSetup works and no fixed part.
  yRep<- cbind( y, y+5, y*1.2)
  LKinfo<- LKrigSetup( x,NC=5, weights= weights, lambda=lambda,
                       nlevel=nlevel,alpha=alpha,a.wght=a.wght,
                       fixedFunction=NULL)
  
  #                       fixedFunctionArgs = list(m = 1))
  
  objR<- LKrig( x,yRep, LKinfo= LKinfo, weights= weights,
                NtrA=5,iseed=122)
  # The equivalent Kriging using mKrig and the LatticeKrig covariance function
  obj0R<- mKrig( x,yRep, weights= weights, lambda=LKinfo$lambda, m=0,
                 cov.function="LKrig.cov",
                 cov.args=list(LKinfo=LKinfo), collapseFixedEffect = FALSE,
                 NtrA=5, iseed=122)
  # quick up front test of likelihood computation
  # This is only valid if mKrig is computating the likelihood correctly ;-).  
  test.for.zero( objR$rho.MLE,obj0R$rho.MLE, 
                 tag="individual rho estimates from LKrig and identical compuation
                 using mKrig")
  test.for.zero( objR$rho.MLE.FULL,obj0R$rho.MLE.FULL, 
                 tag=" full rho estimate from LKrig and identical compuation
                 using mKrig")
  test.for.zero( objR$lnProfileLike,obj0R$lnProfileLike, 
                 tag=" individual lnProfile from LKrig and identical computation
                 using mKrig")
  
  
# try this out with replicated data and fixed part 
  Y<- cbind( y,2*y, y*3)
  obj<- LKrig( x,Y,NC=5, weights= weights, lambda=lambda,nlevel=nlevel,alpha=alpha,a.wght=a.wght,
                              NtrA=5,iseed=122)
  LKinfo<- obj$LKinfo
# now check these formulas as implemented in LatticeKrig
  obj0<- mKrig( x,Y, weights= weights, lambda=lambda, m=2, 
                cov.function="LKrig.cov",
                cov.args=list(LKinfo=LKinfo),
                NtrA=20, iseed=122, collapseFixedEffect = FALSE)
  test.for.zero(  obj0$rho.MLE, obj$rho.MLE,
           tag="MLEs for rho with replicate fields" )

  test.for.zero(  obj0$lnProfileLike, obj$lnProfileLike,
                tag="Profile Likelihood concentrated on lambda with replicate fields" )


# test of full likelihood
#    t(y- T%*%d.coef) %*% solve( sigma^2/w + rho*K) %*% ( y- T%*%d.coef)
#    (1/rho) t(y- T%*%d.coef) %*% solve( lambda/w + K) %*% ( y- T%*%d.coef)
#    (1/rho) * quad.form
#  NOTE d.coef the MLE is GLS estimate and only depends on _lambda_ and not rho

# small data set with reps and weights                                        #
  data( ozone2)
  x<-ozone2$lon.lat[1:20,]
  y<- ozone2$y[16,1:20]
  good <-  !is.na( y)
  x<- x[good,]
  y<- y[good]
  N<- length( y)
  set.seed(123)
  weights<- runif(N)
  W<- diag(weights)

  sigma<- .1
  rho<- 2.2
  lambda<- sigma^2/rho

   obj.test<- LKrig( x,Y,NC=5, weights= weights, nlevel=nlevel,alpha=alpha,a.wght=a.wght,
                              NtrA=5,iseed=122, sigma=sigma, rho=rho)
   Tmatrix <- cbind(fields.mkpoly(x, 2))
   res<- Y - Tmatrix%*%obj.test$d.coef
# the M matrix you have all been waiting for!
   M<- (diag(lambda/weights) + LKrig.cov(x,x,LKinfo=obj.test$LKinfo))
   qtest<- diag( t(res)%*% solve( M)%*% res )
   test.for.zero( qtest, obj.test$quad.form, tag="quad form for arbitrary sigma and rho")

   n<- nrow( Y)
   lnDetCov.test<- sum( log( eigen(M)$values))
   test.for.zero( obj.test$lnDetCov, lnDetCov.test, tag="lnDetCov with arbitrary rho sigma")

   lnLike.test<-   (-qtest/(2*rho) - log(2*pi)*(n/2)
                       -(n/2)*log(rho) - (1/2) * lnDetCov.test) 
   test.for.zero( lnLike.test, obj.test$lnLike, tag="lnLike arbitrary sigma and rho")



cat("all done with lnPLike with weights", fill=TRUE)
options( echo=FALSE)
