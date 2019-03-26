library(mrgsolve)


### Name: Req
### Title: Request simulated output
### Aliases: Req Req,mrgmod-method req req,mrgmod-method

### ** Examples

mod <- mrgsolve:::house()

mod %>% Req(CP,RESP) %>% ev(amt=1000) %>%  mrgsim




