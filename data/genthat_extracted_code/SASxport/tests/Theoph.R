
####
## Round-trip test on Theoph data
####

library(SASxport)
Sys.setenv("TZ"="GMT")

write.xport(Theoph,file="theoph.xpt")
Theoph.2 <- read.xport("theoph.xpt")

## Revert to mixed case names
names(Theoph.2) <- names(Theoph)

## Test equality, handling the ordered factor Subject separately because
## SAS xport files don't provide a mechanism for storing factor orders

stopifnot( all( as.character(Theoph$Subject) == as.character(Theoph.2$Subject) ))
stopifnot( all(Theoph[,-1] == Theoph.2[,-1]) )

