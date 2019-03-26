# HEADER ####################################################
# This is file spam/tests/testthat/helper.R.                #
# It is part of the R package spam,                         #
#  --> https://CRAN.R-project.org/package=spam              #
#  --> https://CRAN.R-project.org/package=spam64            #
#  --> https://git.math.uzh.ch/reinhard.furrer/spam         #
# by Reinhard Furrer [aut, cre], Florian Gerber [aut],      #
#    Roman Flury [aut], Daniel Gerber [ctb],                #
#    Kaspar Moesinger [ctb]                                 #
# HEADER END ################################################


require('spam')
# For efficient primary testing:
#    require('spam',lib='lib') ; setwd( 'spam/tests/testthat/') ;require('testthat')
#    for (i in rev(system('ls', intern=T) )) source(i)


spamtest_eq <- function( xtest, xtrue, tol= 1.0e-1, relative=TRUE, label="", ...){
    cxtest <- c(xtest); cxtrue <- c(xtrue)
    if(relative)
        denom <- mean(abs(cxtrue), na.rm = TRUE)
    else
        denom <- 1
    test_value <- sum(abs(cxtest - cxtrue), na.rm = TRUE) / denom
    expect_lt(test_value, tol, label = paste(  "[spamtest_eg failed]", label), ...)
}
spamtest_diff <- function( xtest, xtrue, tol= 1.0e-6, relative=TRUE, label="", ...){
    cxtest <- c(xtest); cxtrue <- c(xtrue)
    if(relative)
        denom <- mean(abs(cxtrue), na.rm = TRUE)
    else
        denom <- 1
    test_value <- sum(abs(cxtest - cxtrue), na.rm = TRUE) / denom
    expect_gt(test_value, tol, label = paste( "[spamtest_diff failed]", label), ...)
}

LIB.LOC <- "../../../lib"

## reset to inital settings
default_options <- list(  spam.eps=.Machine$double.eps,   # smaller than this is considered as zero
                        spam.force64=FALSE,
                        spam.validate=FALSE,            # validate the spam object before calling a native routine for
                                        # increased stability.
                        
                        spam.drop=FALSE,                # drop passed to subset functions
                        
                        spam.printsize=100,             # the max size which we print as regular matrices
                        spam.imagesize=10000,           # the max size which we display as regular matrices
                        spam.cex=1200,                  # scaling factor for scatter displays
                        
                        spam.structurebased=TRUE,      # calculating on nonzero entries only...
                        
                        spam.inefficiencywarning=1e6,  # tell when something inefficient is done
                        
                        spam.trivalues=FALSE,           # with upper./lower/.tri return values (TRUE) or only structure?
                        spam.listmethod="PE",           # method to be used when using spam.list
                        
                        spam.NAOK = FALSE,
                        safemodevalidity=TRUE,  # verify while S4 construction
                        spam.dopivoting=TRUE,           # what type of back/forwardsolve?
                        spam.cholsymmetrycheck=TRUE,     # Should symmetry be tested in the cholesky factorization
                        spam.cholpivotcheck=TRUE,        # Should the pivot be tested?
                        spam.cholupdatesingular="warning",     # ("error", "warning","NULL")
                        spam.cholincreasefactor=c(1.25,1.25),
                        spam.nearestdistincreasefactor=1.3,
                        spam.nearestdistnnz=c(500^2,500)  )

                                        # Load the default settings:
options(default_options)
