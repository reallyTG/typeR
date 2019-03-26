library(mrgsolve)


### Name: ev_seq
### Title: Schedule a series of event objects
### Aliases: ev_seq seq.ev

### ** Examples


e1 <- ev(amt=100, ii=12, addl=1)

e2 <- ev(amt=200)

seq(e1, e2)

seq(e1, wait = 8, e2)

seq(e1, wait = 8, e2, id = 1:10)

ev_seq(wait = 12, e1, wait = 120, e2, wait = 120, e1)

seq(ev(amt=100, ii=12), ev(time=8, amt=200))




