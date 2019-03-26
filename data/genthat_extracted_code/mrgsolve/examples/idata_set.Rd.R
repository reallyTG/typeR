library(mrgsolve)


### Name: idata_set
### Title: Select and modify a idata set for simulation
### Aliases: idata_set idata_set,mrgmod,data.frame-method
###   idata_set,mrgmod,ANY-method idata_set,mrgmod,missing-method

### ** Examples


mod <- mrgsolve:::house()

data(exidata)

exidata

mod %>% idata_set(exidata, ID <= 2) %>% mrgsim %>% plot

mod %>% idata_set(exidata) %>% mrgsim

mod %>% mrgsim(idata=exidata) 




