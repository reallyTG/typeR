## ---- include = FALSE----------------------------------------------------
if (file.exists("test.h5")) file.remove("test.h5")
library(h5)

## ------------------------------------------------------------------------
library(h5)
f <- h5file("test.h5")
f["testgroup/testset"] <- rnorm(100)
testattr <- LETTERS[round(runif(100, max=26))]
h5attr(f["testgroup/testset"], "testattr") <- testattr
f["testgroup/testset"]
h5close(f)

## ------------------------------------------------------------------------
f <- h5file("test.h5")
f["testmat"] <- matrix(rep(1L, 6), nrow=3)
f["testmat"][c(1, 3), 2] <- rep(2L, 2)
#cbind(f["testmat"], matrix(7:9)) # TODO: fix
f["testmat"][]
h5unlink(f, "testmat")
h5close(f)

## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(zoo))
datevec <- seq(as.POSIXct("2015-12-01"), as.POSIXct("2016-01-01"), by = "secs")
tsdat <- zoo(matrix(rnorm(length(datevec) * 3), ncol=3), order.by=datevec)
f <- h5file("test.h5", "a")
f["testseries", chunksize=c(86400, 1)] <- cbind(index(tsdat), coredata(tsdat))
h5flush(f)
tssub <- zoo(f["testseries"][1:86400, 2], order.by=as.POSIXct(f["testseries"][1:86400, 1], origin="1970-01-01"))
identical(tssub, tsdat[1:86400, 1, drop=FALSE])
h5close(f)

## ------------------------------------------------------------------------
f <- h5file("ex-matlab.mat", "r")
dates <- as.Date(f["tseries"][1, 1:3] - 719529)
zoo(t(f["tseries"][2:4, 1:3]), order.by=dates)

## ------------------------------------------------------------------------
f <- h5file("ex-pandas.h5", "r")
dates <- as.Date(f["testset/axis1"][1:3] - 719163, origin="1970-01-01")
zoo(f["testset/block0_values"][1:3, ], order.by=dates)

## ---- include = FALSE----------------------------------------------------
if (file.exists("test.h5")) file.remove("test.h5")

