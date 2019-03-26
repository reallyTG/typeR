## This file is intended to test attributes on entire dataframes / datasets. It
## currently contains some additional variable attributes -- some of which
## currently *fail* (and are commented-out for that reason).  These tests should
## be moved to a separate file and *corrected*.

library(SASxport)
Sys.setenv("TZ"="GMT")

## manually create a data set
abc.out <- data.frame(
  x=c(1,     2, NA,   NA),
  y=c('a', 'B', NA,  '*'),
  z=c(1,     3, Inf,  NA)
)

## add a data set label (not used by R)
label(abc.out, self=TRUE) <- "xxxx data set xxxxx"
SAStype(abc.out) <- "normal"

## add a format specifier (not used by R)
SASformat (abc.out$x) <- 'DATE7.'
SASiformat(abc.out$x) <- 'DATE11.'

SASformat (abc.out$y) <- '$ASCII2.'
SASiformat(abc.out$y) <- '$ASCII4.'

SASformat (abc.out$z) <- '2.'
SASiformat(abc.out$z) <- '3.'

## add a variable label (not used by R)
label(abc.out$x)  <- 'date variable'
label(abc.out$y)  <- 'character variable'
label(abc.out$z)  <- 'numeric variable'

# create a SAS XPORT file from our local data frame
write.xport(abc.out,
            file="dfAttributes.xpt",
            cDate=strptime("28JUL07:21:08:06 ", format="%d%b%y:%H:%M:%S"),
            osType="SunOS",
            sasVer="9.1",
            autogen.formats=FALSE
            )

# read the SAS data back in
abc.in <- read.xport("dfAttributes.xpt",
                     names.tolower=TRUE,
                     verbose=TRUE)

## Test that the files are otherwise identical
label(abc.out, self=TRUE, "MISSING!")
label(abc.in , self=TRUE, "MISSING!")

stopifnot( label  (abc.out, self=TRUE, "MISSING!") ==
             label  (abc.in,  self=TRUE, "MISSING!") )

SAStype(abc.out, "MISSING!")
SAStype(abc.in , "MISSING!")

stopifnot( SAStype(abc.out, "MISSING!") ==
           SAStype(abc.in,  "MISSING!") )

SASformat(abc.out)
SASformat(abc.in)

#!# This test fails, and the issue should be itentified and corrected
#!# in the next version.
#!# stopifnot( identical(SASformat(abc.out), SASformat(abc.in ) ) )

SASiformat(abc.out)
SASiformat(abc.in )

#!# This test fails, and the issue should be itentified and corrected
#!# in the next version.
#!# stopifnot( identical(SASiformat(abc.out), SASiformat(abc.in ) ) )

