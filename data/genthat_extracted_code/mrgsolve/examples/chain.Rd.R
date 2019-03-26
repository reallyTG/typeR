library(mrgsolve)


### Name: chain
### Title: Functions for chaining commands together
### Aliases: chain

### ** Examples


mod <- mrgsolve:::house()

data(exidata)
data(exTheoph)

out <- mod %>% data_set(exTheoph) %>% mrgsim()
out <- mod %>% carry_out(evid) %>% ev(amt=100, cmt=1) %>% mrgsim()
out <- mod %>% Req(CP,RESP) %>% mrgsim()



