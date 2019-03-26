library(networkR)


### Name: mksib
### Title: Generate variables (or lists) of siblings from a file of ids of
###   persons and their father and mother.
### Aliases: mksib
### Keywords: manip

### ** Examples


library( data.table )
id <- 1:12
pid <- c(NA,  1, 1, 1, NA, 23, 45, 5, 5, 7, 12, NA)
mid <- c(NA, NA, 2, 2, 12, NA, 46, 6, 6, 6, NA, 12)
indd <- data.table( id, mid, pid )
indata <- copy( indd )
indata

str( xx <- mksib( indata ) )
xx

zz <- mksib( indata, 2, e=FALSE )
zz




