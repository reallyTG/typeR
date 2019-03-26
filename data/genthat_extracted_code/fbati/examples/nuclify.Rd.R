library(fbati)


### Name: nuclify
### Title: Nuclify and Merge
### Aliases: nuclify nuclifyMerged mergePhePed
### Keywords: interface

### ** Examples

## Create some pedigree structure
##
##   100 --- 101
##        |
##       201---202
##           |
##     -------------
##     |   |   |   |
##    301 302 303 304
ped <- as.ped( data.frame( pid    = rep(1,8),
                           id     = c(100,101, 201,202, 301,302,303,304),
                           idfath = c(0,0,     100,0,   201,201,201,201),
                           idmoth = c(0,0,     101,0,   202,202,202,202),
                           sex    = c(1,2,     1,2,     2,2,2,2),
                           AffectionStatus = rep(0,8),
                           m0.a = rep(2,8),
                           m0.b = rep(2,8) ) )

## Which should chop up into
##   100 --- 101    201---202
##        |             |
##       201      -------------
##                |   |   |   |
##               301 302 303 304
nuclifyMerged( ped )

## NOTE: We could have merged the ped with a phe object,
##        via the 'mergePhePed' routine before running.



