library(SASxport)
Sys.setenv("TZ"="GMT")

## Call C-level test routines

.C("doTest",PACKAGE="SASxport")

## Successful completion means all assertions have been met
