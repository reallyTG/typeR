#!/usr/bin/Rscript

Sys.setenv(TZ="America/Chicago")
options(digits.secs=6)
library(RApiDatetime)

x <- format(as.POSIXct(Sys.time() + 0:1, origin="1970-01-01"))
str(x)

X <- rapistrptime(x, "%Y-%m-%d %H:%M:%OS", "")
str(X)

str(rapiAsPOSIXct(X))
str(rapiAsPOSIXlt(rapiAsPOSIXct(X)))

str(rapiPOSIXlt2D(X))

str(rapiD2POSIXlt(rapiPOSIXlt2D(X)))

str(rapiFormatPOSIXlt(X, "%Y-%b-%d %H:%M:%OS"))
str(rapiFormatPOSIXlt(X, "%Y-%b-%d %H:%M:%OS", TRUE))

str(asDatePOSIXct(.POSIXct(1540181413, "America/Chicago")))
