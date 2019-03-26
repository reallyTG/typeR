# HEADER ####################################################
# This is file spam/tests/testthat/test-constructors.R.     #
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

  # source("tests/testthat/helper.R")#####
## library("testthat")
## library("spam64", lib.loc = LIB.LOC)
## library("spam", lib.loc = "../../../lib/")


context("test-constructors.R")

options(spam.printsize = 60)

set.seed(14)
n <- 7
ln <- 50
A <- spam(0,n,n)
is <- sample(n, ln, replace = TRUE)
js <- sample(n, ln, replace = TRUE)

A[ unique( cbind(is,js))[1:16,] ] <- 1:8


re <- A@rowpointers
rowpointers(A) <- re

# following will case error, thus the `try`
test_that("test for error messages", {
    r <- re; r[1:2] <- rev(r[1:2]);
    expect_error(rowpointers(A) <- r,
                 "row pointers are not monotone increasing")
    r <- re; r[n+1] <- 2;
    expect_error(rowpointers(A) <- r,
                 "row pointers are not monotone increasing")
    r <- re; r[1] <- 0;
    expect_error(rowpointers(A) <- r,
                 "first element of row pointers is < 1")
    r <- re; r[n+1] <- 20;
    expect_error( rowpointers(A) <- r  )
    r <- c(rep(1,n),n+1);
    expect_error( rowpointers(A) <- r  )


    ce <- A@colindices
    colindices(A) <- ce

    ## TODO expect error or not ?? currrently does not return an error
    ## r <- ce; r[1:4] <- rev(r[1:4]);
    ## expect_error( colindices(A) <- r  )
    r <- ce; r[1] <- 0;
    expect_error( colindices(A) <- r  )
    r <- ce; r[1] <- 20;
    expect_error( colindices(A) <- r  )

    entries(A) <- A@entries
    expect_error( entries(A) <- as.logical(A@entries))
    expect_error( entries(A) <- c(r,1))


    expect_error( entries(A) <- r[-1])
    expect_error( dimension(A) <- c(1,2))
})

