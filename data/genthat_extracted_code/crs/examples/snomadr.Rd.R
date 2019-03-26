library(crs)


### Name: snomadr
### Title: R interface to NOMAD
### Aliases: snomadr
### Keywords: optimize interface

### ** Examples

## Not run: 
##D ## List all options
##D snomadr(information=list("help"="-h"))
##D 
##D ## Print given option,  for example,  MESH_SIZE
##D snomadr(information=list("help"="-h MESH_SIZE"))
##D 
##D ## Print the version of NOMAD
##D snomadr(information=list("version"="-v"))
##D 
##D ## Print usage and copyright
##D snomadr(information=list("info"="-i"))
##D 
##D ## This is the example found in
##D ## NOMAD/examples/basic/library/single_obj/basic_lib.cpp
##D 
##D eval.f <- function ( x ) {
##D 
##D     f <- c(Inf, Inf, Inf);
##D     n <- length (x);
##D 
##D     if ( n == 5 && ( is.double(x) || is.integer(x) ) ) {
##D         f[1] <- x[5];
##D         f[2] <- sum ( (x-1)^2 ) - 25;
##D         f[3] <- 25 - sum ( (x+1)^2 );
##D     }  
##D 
##D     return ( as.double(f) );
##D }
##D 
##D ## Initial values
##D x0 <- rep(0.0, 5 )
##D 
##D bbin <-c(1, 1, 1, 1, 1)
##D ## Bounds
##D lb <- rep(-6.0,5 )
##D ub <- c(5.0, 6.0, 7.0, 1000000, 100000)
##D 
##D bbout <-c(0, 2, 1)
##D ## Options
##D opts <-list("MAX_BB_EVAL"=500,
##D             "MIN_MESH_SIZE"=0.001,
##D             "INITIAL_MESH_SIZE"=0.1,
##D             "MIN_POLL_SIZE"=1)
##D 
##D snomadr(eval.f=eval.f,n=5,  x0=x0, bbin=bbin, bbout=bbout, lb=lb, ub=ub, opts=opts)
##D 
##D 
##D ## How to transfer other parameters into eval.f
##D ##
##D ## First example: supply additional arguments in user-defined functions
##D ##
##D 
##D ## objective function and gradient in terms of parameters
##D eval.f.ex1 <- function(x, params) { 
##D     return( params[1]*x^2 + params[2]*x + params[3] ) 
##D }
##D 
##D ## Define parameters that we want to use
##D params <- c(1,2,3)
##D 
##D ## Define initial value of the optimization problem
##D x0 <- 0
##D 
##D ## solve using snomadr 
##D snomadr( n          =1, 
##D         x0          = x0, 
##D         eval.f      = eval.f.ex1, 
##D         params      = params )
##D 
##D 
##D ##
##D ## Second example: define an environment that contains extra parameters
##D ##
##D 
##D ## Objective function and gradient in terms of parameters
##D ## without supplying params as an argument
##D eval.f.ex2 <- function(x) { 
##D     return( params[1]*x^2 + params[2]*x + params[3] ) 
##D }
##D 
##D ## Define initial value of the optimization problem
##D x0 <- 0
##D 
##D ## Define a new environment that contains params
##D auxdata        <- new.env()
##D auxdata$params <- c(1,2,3)
##D 
##D ## pass The environment that should be used to evaluate functions to snomadr 
##D snomadr(n                  =1, 
##D         x0                 = x0, 
##D         eval.f             = eval.f.ex2, 
##D         snomadr.environment = auxdata )
##D 
##D ## Solve using algebra
##D cat( paste( "Minimizing f(x) = ax^2 + bx + c\n" ) )
##D cat( paste( "Optimal value of control is -b/(2a) = ", -params[2]/(2*params[1]), "\n" ) )
##D cat( paste( "With value of the objective function f(-b/(2a)) = ",
##D            eval.f.ex1( -params[2]/(2*params[1]), params ), "\n" ) )
##D 
##D ## The following example is NOMAD/examples/advanced/multi_start/multi.cpp
##D ## This will call smultinomadRSolve to resolve the problem.  
##D eval.f.ex1 <- function(x, params) { 
##D     M<-as.numeric(params$M)
##D     NBC<-as.numeric(params$NBC)
##D 
##D     f<-rep(0, M+1)
##D     x<-as.numeric(x)
##D 
##D     x1 <- rep(0.0, NBC)
##D     y1 <- rep(0.0, NBC)
##D 
##D     x1[1]<-x[1]
##D     x1[2]<-x[2]
##D     y1[3]<-x[3]
##D     x1[4]<-x[4]
##D     y1[4]<-x[5]
##D 
##D     epi <- 6
##D     for(i in 5:NBC){
##D         x1[i]<-x[epi]
##D         epi <- epi+1
##D         y1[i]<-x[epi]
##D         epi<-epi+1
##D     }
##D     constraint <- 0.0
##D     ic <- 1
##D     f[ic]<-constraint
##D     ic <- ic+1
##D 
##D     constraint <- as.numeric(1.0)
##D     distmax <- as.numeric(0.0)
##D     avg_dist <- as.numeric(0.0)
##D     dist1<-as.numeric(0.0)
##D 
##D     for(i in 1:(NBC-1)){
##D         for (j in (i+1):NBC){
##D             dist1 <- as.numeric((x1[i]-x1[j])*(x1[i]-x1[j])+(y1[i]-y1[j])*(y1[i]-y1[j]))
##D             
##D             if((dist1 > distmax)) {distmax <- as.numeric(dist1)}
##D             if((dist1[1]) < 1) {constraint <- constraint*sqrt(dist1)}
##D             else if((dist1) > 14) {avg_dist <- avg_dist+sqrt(dist1)}
##D         }
##D     }
##D 
##D     if(constraint < 0.9999) constraint <- 1001.0-constraint
##D     else constraint = sqrt(distmax)+avg_dist/(10.0*NBC)
##D 
##D     f[2] <- 0.0
##D     f[M+1] <- constraint 
##D 
##D 
##D     return(as.numeric(f) ) 
##D }
##D 
##D ## Define parameters that we want to use
##D params<-list()
##D NBC <- 5
##D M <- 2
##D n<-2*NBC-3
##D 
##D params$NBC<-NBC
##D params$M<-M
##D x0<-rep(0.1, n)
##D lb<-rep(0, n)
##D ub<-rep(4.5, n)
##D 
##D eval.f.ex1(x0, params)
##D 
##D bbout<-c(2, 2, 0)
##D nmulti=5
##D bbin<-rep(0, n)
##D ## Define initial value of the optimization problem
##D 
##D ## Solve using snomadRSolve
##D snomadr(n            = as.integer(n), 
##D         x0           = x0, 
##D         eval.f       = eval.f.ex1, 
##D         bbin         = bbin, 
##D         bbout        = bbout, 
##D         lb           = lb, 
##D         ub           = ub, 
##D         params       = params )
##D 
##D ## Solve using smultinomadRSolve, if x0 is provided,  x0 will
##D ## be the first initial point,  otherwise,  the program will
##D ## check best_x.txt,  if it exists,  it will be read in as
##D ## the first initial point. Other initial points will be
##D ## generated by uniform distribution.
##D ## nmulti represents the number of mads will run.
##D ##
##D snomadr(n            = as.integer(n), 
##D         eval.f       = eval.f.ex1, 
##D         bbin         = bbin, 
##D         bbout        = bbout, 
##D         lb           = lb, 
##D         ub           = ub, 
##D         nmulti = as.integer(nmulti), 
##D         print.output = TRUE, 
##D         params       = params )
## End(Not run) 



