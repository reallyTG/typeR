library(mrgsolve)


### Name: data_set
### Title: Select and modify a data set for simulation
### Aliases: data_set data_set,mrgmod,data.frame-method
###   data_set,mrgmod,ANY-method data_set,mrgmod,ev-method
###   data_set,mrgmod,missing-method

### ** Examples


mod <- mrgsolve:::house()

data <- expand.ev(ID=1:3, amt=c(10,20))

mod %>% data_set(data, ID > 1) %>% mrgsim

data(extran1)
head(extran1)

mod %>% data_set(extran1) %>% mrgsim
mod %>% mrgsim(data=extran1)




