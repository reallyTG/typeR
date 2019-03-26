# HEADER ####################################################
# This is file spam/tests/testthat/test-dist.R.             #
# It is part of the R package spam,                         #
#  --> https://CRAN.R-project.org/package=spam              #
#  --> https://CRAN.R-project.org/package=spam64            #
#  --> https://git.math.uzh.ch/reinhard.furrer/spam         #
# by Reinhard Furrer [aut, cre], Florian Gerber [aut],      #
#    Roman Flury [aut], Daniel Gerber [ctb],                #
#    Kaspar Moesinger [ctb]                                 #
# HEADER END ################################################


rm(list = ls())
source("helper.R")

## library("testthat")
## library("spam64", lib.loc = LIB.LOC)
## library("spam", lib.loc = "../../../lib/")


context("test-dist.R")


distmatrix <- function(x1,x2=NULL,upper=NULL,...)
  {
    if (is.null(x2)) {
      tmp <- as.matrix(dist(x1,...))
      if (is.null(upper)) return(tmp)
      if (upper) tmp[row(tmp)<col(tmp)] <- -1
      if (!upper) tmp[row(tmp)>col(tmp)] <- -1
      return( tmp[tmp>-0.5])
    } else
      return( as.matrix( dist(rbind(x1,x2),...))[1:dim(x1)[1],1:dim(x2)[1]+dim(x1)[1]])
  }


########
## as an aside, comparing nearest.dist with dist, use diag=true, upper=TRUE

test_that("comparing nearest.dist with dist, use diag=true, upper=TRUE",{

    options(spam.printsize=6)
    
    
    n1 <- as.integer( 4)
    n2 <- n1
    nd <- as.integer(2)
    set.seed(14)
    x2 <- x1 <- array(runif(n1*nd), c( n1,nd))
    
    if (F){
                                        # testing the structure
        distmatrix(x1)
        nearest.dist( x1, x1, upper=NULL)
        
                                        # and all other possibilities (3[upper])
                                        # with x1,x1 and x1, NULL:
        par(mfcol=c(3,2))
        display(   nearest.dist( x1, x1,  upper=NULL))  # default
        display(   nearest.dist( x1, x1,  upper=FALSE))
        display(   nearest.dist( x1, x1,  upper=TRUE))
        display(   nearest.dist( x1,  upper=NULL))
        display(   nearest.dist( x1,  upper=FALSE))
        display(   nearest.dist( x1,  upper=TRUE))
    }


#  nearest.dist( x1) and  nearest.dist( x1,x1) should be identical...
    expect_equal(nearest.dist( x1, x1, upper=NULL),  nearest.dist(x1,  upper=NULL) )
    expect_equal(nearest.dist( x1, x1, upper=FALSE), nearest.dist(x1,  upper=FALSE))
    expect_equal(nearest.dist( x1, x1, upper=TRUE),  nearest.dist(x1,  upper=TRUE) )


# testing  Euclidian
    eta <- 1

    o1 <- nearest.dist( x1, upper=NULL)
    o2 <- distmatrix(x1)
    
    expect_equal(o2[o2< eta], o1@entries)


    o1 <- nearest.dist( x1, upper=!FALSE)  # is default...
    o3 <- distmatrix(x1, upper=!FALSE)
    expect_equal(o1@entries, o3)



    x2 <- x1 <- array(runif(n1*nd), c( n1,nd))
    o1 <- nearest.dist( x1,x2,upper=NULL)
    o2 <- distmatrix(x1,x2)
    
    expect_equal(o2[o2< eta], o1@entries)

    ## TODO check test.
    ## o1 <- nearest.dist( x1, upper=!FALSE)  
    ## expect_equal(o2[o2< eta & lower.tri(o2)], o1@entries)



# Should cause error:
#    nearest.dist(cbind(1,1))
# this is ok:
    spamtest_eq( nearest.dist(rbind(1,0)), c(0,1,0,0))
    spamtest_eq( nearest.dist(cbind(1,1),cbind(1,0)), 1)



                                        # testing with dist only
    spamtest_eq( as.spam( dist(x1)), nearest.dist(x1,delta=2))


# testing some other norms
    method <- "max"
    p <- 1.0001
    o1 <- nearest.dist( x1,method=method,p=p, upper=TRUE )
    o3 <- distmatrix(x1,method=method,p=p, upper=TRUE)
    expect_equal(o1@entries, o3)



    if (F){ # system.time is not always available...
        
        n1 <- as.integer( 400)
        set.seed(14)
        x1 <- array(runif(n1*nd), c( n1,nd))
        
        system.time( o1 <- nearest.dist( x1,method="max",p=p) )
        system.time( o1 <- nearest.dist( x1,method="min",p=1) )
        system.time( o1 <- nearest.dist( x1,method="min",p=1.5) )
        system.time( o1 <- nearest.dist( x1,method="min",p=2) )
        system.time( o1 <- nearest.dist( x1,method="euc",p=1) )
        system.time( o1 <- dist( x1) )
    }
    
                                        # testing  GC
    n1 <- as.integer( 4)
    n2 <- as.integer(6)
    set.seed(14)
    x1 <- array(runif(n1*2,-90,90), c( n1,2))
    x2 <- array(runif(n2*2,-90,90), c( n2,2))
    
    
    
    if (F){
                                        # structure
        delta <-  180
        
        par(mfcol=c(3,2))
        display( nearest.dist( x1,    delta=delta,method="gr",  upper=FALSE))
        display( nearest.dist( x1,    delta=delta,method="gr",  upper=TRUE))
        display( nearest.dist( x1,    delta=delta,method="gr",  upper=NULL))
        display( nearest.dist( x1,x1, delta=delta,method="gr",  upper=FALSE))
        display( nearest.dist( x1,x1, delta=delta,method="gr",  upper=TRUE))
        display( nearest.dist( x1,x1, delta=delta,method="gr",  upper=NULL))
    }
    
                                        # 
    
    if (F){
                                        # if fields would be available, the following can be used as well.
        delta <-  180
        o2 <- rdist.earth(x1)
        o1 <- nearest.dist( x1, method="gr",upper=NULL,delta=delta)
        spamtest_eq(o2- o1@entries)
        
        o2 <- rdist.earth(x1, R=1)
        o1 <- nearest.dist( x1,  method="gr",upper=NULL,delta=delta,R=1) 
        spamtest_eq(o2- o1@entries)
        
        
        delta <- 90
        o2 <- rdist.earth(x2,x1,R=1)
        o1 <- nearest.dist( x1,x2, method="gr",upper=NULL,delta=delta,R=1)
        spamtest_eq(o2[o2<delta*pi/180]- o1@entries)
        
        
    }
## })
    
## # correct storage mode conversion
## test_that("storage conversion", {
    nx <- 4
    x <- expand.grid(as.double(1:nx),as.double(1:nx))
    expect_equal(nearest.dist( x,delta=nx*2, upper=TRUE)@entries, 
                distmatrix(x, upper=TRUE))
    x <- expand.grid(as.integer(1:nx),as.integer(1:nx))
    expect_equal(nearest.dist( x,delta=nx*2, upper=TRUE)@entries,
                 distmatrix(x, upper=TRUE))


# again a bit playing with the parameters:
    if (F){
        rdist.earth(x1, R=1)
        nearest.dist( x1, x1,  method="gr",delta=180,R=1 )
        nearest.dist( x1,      method="gr",delta=180,R=1, upper=FALSE)
        nearest.dist( x1,      method="gr",delta=180,R=1, upper=TRUE)
        nearest.dist( x1,x1,   method="gr",delta=180,R=1, upper=FALSE)
        nearest.dist( x1,x1,   method="gr",delta=180,R=1, upper=TRUE)
    }


# When setting
#     spam.options(nearestdistnnz=c(3,3))
# we do not get a warning because there is a min.
#   nnz <- min(max(.Spam$nearestdistnnz[1], n1 * .Spam$nearestdistnnz[2]),
#              (as.double(n1) * (n1 + 1))/ifelse(is.null(upper),1, 2),
#              2^31 - 2)









#################################################################
# addendum:

    expect_equal( as.spam(dist(0))@entries, 0)
    expect_equal( as.spam(dist(x1)), as.spam(nearest.dist(x1,delta=1000)))

# diag and upper are only processed when displaying
    expect_equal( as.spam(dist(x1)), as.spam(dist(x1,  upper=TRUE)) )

# 'NA/NaN/Inf's are coerced to zero:
      expect_warning( as.spam(dist(c(0, NA, 1)))@entries)
})

