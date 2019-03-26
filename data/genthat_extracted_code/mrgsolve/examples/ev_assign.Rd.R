library(mrgsolve)


### Name: ev_assign
### Title: Replicate a list of events into a data set
### Aliases: ev_assign assign_ev

### ** Examples

ev1 <- ev(amt=100)
ev2 <- ev(amt=300, rate=100, ii=12, addl=10)

idata <- data.frame(ID=1:10) 
idata$arm <- 1+(idata$ID %%2)

ev_assign(list(ev1,ev2), idata, "arm", join=TRUE)






