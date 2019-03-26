library(LatticeKrig)


### Name: LKrig.MLE
### Title: Simple function to search over covariance parameters for Lattice
###   Krig.
### Aliases: LKrig.MLE LKrigFindLambda LKrigFindLambdaAwght
###   LambdaAwghtObjectiveFunction LKrig.make.par.grid omega2Awght
###   Awght2Omega
### Keywords: spatial

### ** Examples

# 
# fitting summer precip for  sub region of North America (Florida)
# (tiny subregion is just to make this run under 5 seconds). 
# total precip in 1/10 mm for JJA 
  data(NorthAmericanRainfall)
# rename for less typing
  x<- cbind( NorthAmericanRainfall$longitude, NorthAmericanRainfall$latitude)
  y<- log10(NorthAmericanRainfall$precip)
# cut down the size of this data set so examples run quickly
  ind<- x[,1] > -90 & x[,2] < 35 #
  x<- x[ind,]
  y<- y[ind]

# This is a single level smoother
 
  LKinfo<- LKrigSetup(x,NC=4, nlevel=1, a.wght=5, alpha=1.0)
  lambdaFit<- LKrigFindLambda( x,y,LKinfo=LKinfo)
  lambdaFit$summary

## Not run: 
##D # grid search over parameters 
##D   NG<-15
##D   par.grid<- list( a.wght= rep( 4.05,NG),alpha= rep(1, NG),
##D                       llambda=  seq(-8,-2,,NG))
##D   lambda.search.results<-LKrig.MLE( x,y,LKinfo=LKinfo,
##D                                     par.grid=par.grid,
##D                                     lambda.profile=FALSE)
##D   lambda.search.results$summary
##D # profile likelihood
##D   plot( lambda.search.results$summary[,1:2], 
##D          xlab="effective degrees freedom",
##D          ylab="ln profile likelihood")
##D # fit at largest likelihood value:
##D   lambda.MLE.fit<- LKrig( x,y,
##D                     LKinfo=lambda.search.results$LKinfo.MLE)
## End(Not run)                    
                    
## Not run: 
##D                     
##D # optimizing  Profile likelihood over lambda using optim
##D # consider 3 values for a.wght (range parameter)
##D # in this case the log lambdas passed are the starting values for optim.
##D   NG<-3
##D   par.grid<- list( a.wght= c( 4.05,4.1,5) ,alpha= rep(1, NG),
##D                       llambda= c(-5,NA,NA))
##D # NOTE: NAs in llambda mean use the previous MLE for llambda as the
##D # current starting value. 
##D   LKinfo<- LKrigSetup(x,NC=12,nlevel=1, a.wght=5, alpha=1.0) 
##D   lambda.search.results<-LKrig.MLE(
##D                               x,y,LKinfo=LKinfo, par.grid=par.grid,
##D                               lambda.profile=TRUE)
##D   print(lambda.search.results$summary)
##D # note first result a.wght = 4.05 is the optimized result for the grid
##D # search given above.
## End(Not run)
########################################################################    
# search over two multi-resolution levels varying the  levels of alpha's
########################################################################
## Not run: 
##D # NOTE: search ranges found largely by trial and error to make this
##D # example work also the grid is quite coarse ( and NC is small) to
##D # be quick as a help file example
##D   data(NorthAmericanRainfall)
##D # rename for less typing
##D   x<- cbind( NorthAmericanRainfall$longitude, NorthAmericanRainfall$latitude)
##D # total precip in 1/10 mm for JJA 
##D  y<- log10(NorthAmericanRainfall$precip)
##D # cut down the size of this data set so examples run quickly
##D # examples also work with  the full data set. Also try NC= 100 for a
##D # nontrivial model.
##D   ind<- x[,1] > -90 & x[,2] < 35 #
##D   x<- x[ind,]
##D   y<- y[ind]
##D   
##D   Ndes<- 10  
##D # NOTE: this is set to be very small just to make this
##D #       example run fast
##D   set.seed(124)
##D   par.grid<- list()
##D # create grid of alphas to sum to 1 use a mixture model parametrization
##D #  alpha1 = (1/(1 + exp(gamma1)) ,
##D # alpha2 = exp( gamma1) / ( 1 + exp( gamma1))
##D # 
##D   par.grid$gamma<- cbind(runif( Ndes, -3,2), runif( Ndes, -3,2))
##D   par.grid$a.wght<- rep( 4.5, Ndes)
##D # log lambda grid search values
##D   par.grid$llambda<- runif( Ndes,-5,-3)  
##D   LKinfo1<- LKrigSetup( x, NC=5, nlevel=3, a.wght=5, alpha=c(1.0,.5,.25))
##D # NOTE: a.wght in call is not used. Also a better search is to profile over
##D #  llambda
##D 
##D  alpha.search.results<- LKrig.MLE( x,y,LKinfo=LKinfo1, par.grid=par.grid,
##D                                     lambda.profile=FALSE)
##D 
##D ########################################################################
##D # Viewing the search results
##D ########################################################################
##D 
##D # this scatterplot is good for a quick look because  effective degrees
##D # of freedom is a useful summary of fit. 
##D   plot( alpha.search.results$summary[,1:2], 
##D          xlab="effective degrees freedom",
##D          ylab="ln profile likelihood")
##D #
## End(Not run)

## Not run: 
##D # a two level model search 
##D # with profiling over lambda.
##D data(NorthAmericanRainfall)
##D # rename for less typing
##D   x<- cbind( NorthAmericanRainfall$longitude,
##D              NorthAmericanRainfall$latitude)
##D # mean total precip in 1/10 mm for JJA 
##D   y<- log10(NorthAmericanRainfall$precip)
##D 
##D #  This takes a few minutes
##D   Ndes<- 40 
##D   nlevel<-2 
##D   par.grid<- list()
##D ## create grid of alphas to sum to 1 use a mixture model parametrization:
##D #    alpha1 = (1/(1 + exp(gamma1)) ,
##D #   alpha2 = exp( gamma1) / ( 1 + exp( gamma1))
##D   set.seed(123)
##D   par.grid$gamma<- runif( Ndes,-3,4)
##D ## values for range (a.wght)
##D   par.grid$a.wght<- 4 + 1/exp(seq( 0,4,,Ndes))
##D # log lambda grid search values (these are the starting values)
##D   par.grid$llambda<- rep(-4, Ndes)
##D 
##D   LKinfo1<- LKrigSetup( x, NC=15, nlevel=nlevel, 
##D                           a.wght=5, alpha=rep( NA,2) ) 
##D ##
##D ## the search over the parameter list in par.grid  maximizing over lambda 
##D   search.results<- LKrig.MLE( x,y,LKinfo=LKinfo1, par.grid=par.grid,
##D                                  lambda.profile=TRUE)
##D # plotting results of likelihood search
##D set.panel(1,2)
##D  plot( search.results$summary[,1:2], 
##D          xlab="effective degrees freedom",
##D          ylab="ln profile likelihood")
##D  xtemp<- matrix(NA, ncol=2, nrow=Ndes)
##D  for( k in 1:Ndes){
##D    xtemp[k,] <- c( (search.results$par.grid$alpha[[k]])[1],
##D                   (search.results$par.grid$a.wght[[k]])[1] )
##D }
##D  quilt.plot( xtemp,search.results$summary[,2])
##D #  fit using Tps
##D  tps.out<- Tps(  xtemp,search.results$summary[,2], lambda=0)
##D  contour( predictSurface(tps.out), lwd=3,add=TRUE)
##D  set.panel()
## End(Not run)
## Not run: 
##D # searching over nu 
##D data(ozone2)
##D x<- ozone2$lon.lat
##D y<- ozone2$y[16,]
##D good<- !is.na(y)
##D y<- y[good]
##D x<- x[good,]
##D par.grid<- expand.grid( nu = c(.5,1.0, 1.5), a.wght= list(4.1,4.5,5) )
##D par.grid$llambda<- rep( NA, length(par.grid$nu))
##D LKinfo<- LKrigSetup(x,  nlevel=3, nu=.5, NC=5, a.wght=4.5)
##D out<- LKrig.MLE( x,y, LKinfo=LKinfo, par.grid=par.grid)
##D # take a look
##D cbind( par.grid, out$summary[,1:5])
## End(Not run)
## Not run: 
##D # an MLE fit taking advantage of replicated fields
##D # check based on simulated data
##D 
##D N<- 200
##D M<-50 # number of independent replicated fields
##D sigma<- sqrt(.01)
##D set.seed(123)
##D x<- matrix( runif(N*2), N,2)
##D                 
##D LKinfo<- LKrigSetup( x, NC=16, nlevel=1,
##D                  a.wght=4.5, lambda=.01, 
##D                 fixed.Function=NULL,
##D                 normalize=TRUE)  
##D                 
##D # the replicate fields
##D truef<-  LKrig.sim(x,LKinfo=LKinfo, M=M )
##D set.seed(222)
##D error<- sigma*matrix( rnorm(N*M), N,M)
##D y<- truef + error 
##D # with correct lambda
##D obj<- LKrig( x,y, LKinfo=LKinfo, lambda=.01, )
##D print( obj$sigma.MLE.FULL)
##D print( obj$rho.MLE.FULL)
##D 
##D fitMLE1<- LKrigFindLambda( x,y, LKinfo=LKinfo)
##D fitMLE1$summary
##D aWghtGrid<-  c( 4.01, 4.05, 4.1, 4.2, 4.5, 4.6, 4.7, 5, 8, 16)
##D par.grid<- list( a.wght = aWghtGrid)
##D 
##D fitMLE2<- LKrig.MLE( x,y, LKinfo=LKinfo,
##D                       par.grid= par.grid )
##D fitMLE2$summary   
##D 
##D LKinfo1<- LKinfoUpdate( LKinfo, lambda=.1, a.wght= 4.2)                   
##D fitMLE4<- LKrigFindLambdaAwght( x,y, LKinfo=LKinfo1)
##D fitMLE4$summary
##D 
##D plot(  log( aWghtGrid -4)/2, fitMLE2$summary[,2], type="b",
##D   xlab="log( a.wght - 4)/2",
##D   ylab= "log Profile likelihood" )
##D 
##D 
##D points( log(fitMLE4$summary["a.wght.MLE"] -4)/2,
##D      fitMLE4$summary["lnProfLike"], pch="+", col="red"  )
##D xline( log(fitMLE4$summary["a.wght.MLE"] -4)/2, col="red", lty=2)
## End(Not run)




