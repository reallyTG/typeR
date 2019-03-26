library(widals)


### Name: fun.load
### Title: Stochastic Search Helper Functions
### Aliases: fun.load fun.load.hals.a fun.load.hals.fill fun.load.widals.a
###   fun.load.widals.fill
### Keywords: ~kwd1 ~kwd2

### ** Examples


### Here's an itty bitty example:
### we use stochastic search to find the minimum number in a vector
### GP isn't used here, and hence neither are p.ndx.ls nor f.d
### however, we still need to create them since MSS.snow requires their existence

fun.load.simpleExample <- function() {

   if( run.parallel ) {
         sfExport("xx")
    }
    
    p.ndx.ls <- list( c(1) )
    assign( "p.ndx.ls", p.ndx.ls, pos=globalenv() )
    f.d <- list( dlog.norm )
    assign( "f.d", f.d, pos=globalenv() )
    
    FUN.MH <- function(jj, GP.mx, X) {
        our.cost <- sample(xx, 1)
    }
    assign( "FUN.MH", FUN.MH, pos=globalenv() )
    
    FUN.GP <- NULL
    assign( "FUN.GP", FUN.GP, pos=globalenv() )
    
    
    FUN.I <- function(envmh, X) {
        cat( "Hello, I have found an even smaller number in xx ---> ", envmh$current.best, "\n" )
    }
    assign( "FUN.I", FUN.I, pos=globalenv() )
    
    FUN.EXIT <- function(envmh, X) {
        cat( "Done",   "\n" )
    }
    assign( "FUN.EXIT", FUN.EXIT, pos=globalenv() )
}

xx <- 1:600

GP <- c(1)
MH.source <- fun.load.simpleExample

run.parallel <- TRUE
sfInit(TRUE, 2)
MSS.snow(MH.source, Inf, p.ndx.ls, f.d, matrix(1, nrow=28), 28, 7)
sfStop()




### Here's another itty bitty example:
### we use stochastic search to find the mean of a vector
### i.e., the argmin? of sum ( x - ? )^2

fun.load.simpleExample2 <- function() {

   if( run.parallel ) {
         sfExport("xx")
    }
    
    p.ndx.ls <- list( c(1) )
    assign( "p.ndx.ls", p.ndx.ls, pos=globalenv() )
    f.d <- list( unif.mh )
    assign( "f.d", f.d, pos=globalenv() )
    
    FUN.MH <- function(jj, GP.mx, X) {
        our.cost <- sum( ( xx - GP.mx[jj, 1] )^2 )
        return(our.cost)
    }
    assign( "FUN.MH", FUN.MH, pos=globalenv() )
    
    FUN.GP <- NULL
    assign( "FUN.GP", FUN.GP, pos=globalenv() )
    
    FUN.I <- function(envmh, X) {
        cat( "Improvement ---> ", envmh$current.best, " ---- " , envmh$GP, "\n" )
    }
    assign( "FUN.I", FUN.I, pos=globalenv() )
    
    FUN.EXIT <- function(envmh, X) {
        our.cost <- envmh$current.best
        GP <- envmh$GP
        cat( "Done",   "\n" )
        cat( envmh$GP, our.cost, "\n" )
    }
    assign( "FUN.EXIT", FUN.EXIT, pos=globalenv() )
}

##set.seed(99999)
xx <- rnorm(300, 5, 10)

GP <- c(10)
MH.source <- fun.load.simpleExample2

run.parallel <- TRUE
sfInit(TRUE, 2)
MSS.snow(MH.source, Inf, p.ndx.ls, f.d, matrix(1/10, nrow=140, ncol=length(GP)), 140, 14)
sfStop()

##### in fact:
mean(xx)




