library(mrgsolve)


### Name: mread
### Title: Read a model specification file
### Aliases: mread mread_cache mread_file

### ** Examples


## Not run: 
##D code <- '
##D $PARAM CL = 1, VC = 5
##D $CMT CENT
##D $ODE dxdt_CENT = -(CL/VC)*CENT;
##D '
##D 
##D mod <- mcode("ex_mread", code)
##D 
##D mod
##D 
##D mod %>% init(CENT=1000) %>% mrgsim %>% plot
##D 
##D 
##D mod <- mread("irm3", modlib())
##D 
##D mod
##D 
##D # if the model is in the file mymodel.cpp
##D mod <- mread("mymodel")
##D 
##D # if the model is in the file mymodel.txt
##D mod <- mread(file = "mymodel.txt")
##D 
##D or
##D 
##D mod <- mread_file("mymodel.txt")
##D 
##D 
## End(Not run)




