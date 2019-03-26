library(mrgsolve)


### Name: mcode
### Title: Write, compile, and load model code
### Aliases: mcode mcode_cache

### ** Examples


## Not run: 
##D  
##D code <- '
##D $CMT DEPOT CENT
##D $PKMODEL ncmt=1, depot=TRUE
##D $MAIN
##D double CL = 1;
##D double V = 20;
##D double KA = 1;
##D '
##D 
##D mod <- mcode("example",code)
## End(Not run)




