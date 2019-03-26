library(bootSVD)


### Name: ffmatrixmult
### Title: Matrix multiplication with "ff_matrix" or "matrix" inputs
### Aliases: ffmatrixmult

### ** Examples

## Not run: 
##D  library(ff)
##D 	#Tall data
##D 	y_tall<-matrix(rnorm(5000),500,10) #y tall
##D 	x_tall<-matrix(rnorm(5000),500,10)
##D 	y_wide<-t(y_tall)
##D 	x_wide<-t(x_tall)
##D 	y_tall_ff<-as.ff(y_tall) #y tall and ff
##D 	x_tall_ff<-as.ff(x_tall)
##D 	y_wide_ff<-as.ff(y_wide) #y tall and ff
##D 	x_wide_ff<-as.ff(x_wide)
##D 
##D  #Set options to ensure that block matrix algebra is actually done,
##D  #and the entire algebra isn't just one in one step.
##D  #Compare ffmatrixmult against output from standard methods
##D  options('ffbytesize'=100)
##D 
##D  #small final matrices
##D 	#x'x
##D 	range(  crossprod(x_tall) - ffmatrixmult(x_tall_ff, xt=TRUE)  )
##D 	range(  tcrossprod(x_wide) - ffmatrixmult(x_wide_ff, yt=TRUE)  )
##D 	range(  crossprod(x_tall,y_tall) - ffmatrixmult(x_tall_ff,y_tall_ff, xt=TRUE)  )
##D 	range(  tcrossprod(x_wide,y_wide) - ffmatrixmult(x_wide_ff,y_wide_ff, yt=TRUE)  )
##D 	range(  (x_wide%*%y_tall) - ffmatrixmult(x_wide_ff,y_tall_ff)  )
##D 
##D 	#ff + small data
##D 	s_tall <- matrix(rnorm(80),10,8)
##D 	s_wide <- matrix(rnorm(80),8,10)
##D 
##D 	#tall output
##D 	range(  crossprod(x_wide, s_tall) - ffmatrixmult(x_wide_ff, s_tall,xt=TRUE)[]  )
##D 	range(  tcrossprod(x_tall, s_wide) - ffmatrixmult(x_tall_ff, s_wide,yt=TRUE)[]  )
##D 	range( x_tall%*%s_tall - ffmatrixmult(x_tall_ff, s_tall)[])
##D 
##D 	#Wide output
##D 	range(  crossprod(s_tall, y_wide) - ffmatrixmult( s_tall, y_wide_ff,xt=TRUE)[]  )
##D 	range(  tcrossprod(s_wide, y_tall) - ffmatrixmult( s_wide,y_tall_ff,yt=TRUE)[]  )
##D 	range( s_wide%*%y_wide - ffmatrixmult(s_wide,y_wide_ff)[])
##D 
##D  #Reset options for more practical use
##D  options('ffbytesize'=16777216)
##D 
## End(Not run)



