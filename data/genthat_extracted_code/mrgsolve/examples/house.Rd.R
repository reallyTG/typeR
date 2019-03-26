library(mrgsolve)


### Name: house
### Title: Return a pre-compiled, PK/PD model
### Aliases: house

### ** Examples


mod <- mrgsolve:::house()

see(mod)

mod %>% ev(amt=100) %>% mrgsim %>% plot




