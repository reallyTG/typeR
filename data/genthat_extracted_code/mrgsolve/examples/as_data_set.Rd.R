library(mrgsolve)


### Name: as_data_set
### Title: Create a simulatinon data set from ev objects
### Aliases: as_data_set as_data_set,ev-method
###   as_data_set,data.frame-method

### ** Examples


as_data_set(ev(amt=c(100,200), cmt=1, ID=1:3),
            ev(amt=300, time=24, ID=1:2),
            ev(amt=1000, ii=8, addl=10, ID=1:3))

# Instead of this, use expand.ev
as_data_set(ev(amt=100), ev(amt=200),ev(amt=300))




