library(mrgsolve)


### Name: mrgsim
### Title: Simulate from a model object
### Aliases: mrgsim mrgsim_df

### ** Examples

## example("mrgsim")

e <- ev(amt = 1000)
mod <- mrgsolve:::house() 
out <- mod %>% ev(e) %>% mrgsim()
plot(out)

out <- mod %>% ev(e) %>% mrgsim(end=22)
out

data(exTheoph)

out <- mod %>% data_set(exTheoph) %>% mrgsim()
out

out <- mod %>% mrgsim(data=exTheoph)

out <- mrgsim(mod, data=exTheoph, obsonly=TRUE)
out

out <- mod %>% mrgsim(data=exTheoph, obsaug=TRUE, carry.out="a.u.g")
out

out <- mod %>% ev(e) %>% mrgsim(req="CENT")
out

out <- mrgsim(mod, Req="CP,RESP", events = e)
out





