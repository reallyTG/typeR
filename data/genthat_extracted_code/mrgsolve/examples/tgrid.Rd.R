library(mrgsolve)


### Name: tgrid
### Title: Create a simtime object
### Aliases: tgrid stime,tgrid-method stime,tgrids-method
###   stime,numeric-method show,tgrid-method show,tgrids-method
###   stime,mrgmod-method

### ** Examples


peak <- tgrid(0,6,0.2)
sparse <- tgrid(0,24,4)

day1 <- c(peak,sparse)

design <- c(day1, day1+72, day1+240)

## Not run: 
##D mod <- mrgsolve:::house()
##D 
##D out <- mod %>% ev(amt=1000, ii=24, addl=10) %>% mrgsim(tgrid=design)
##D 
##D plot(out,CP~., type='b')
## End(Not run)



