library(mrgsolve)


### Name: ev
### Title: Event objects for simulating PK and other interventions
### Aliases: ev ev,mrgmod-method ev,missing-method ev,ev-method

### ** Examples

mod <- mrgsolve:::house()
mod <- mod %>% ev(amt=1000, time=0, cmt=1)
events(mod)

loading <- ev(time=0, cmt=1, amt=1000)
maint <- ev(time=12, cmt=1, amt=500, ii=12, addl=10)
loading + maint


ev(ID=1:10, cmt=1, time=0, amt=100)





