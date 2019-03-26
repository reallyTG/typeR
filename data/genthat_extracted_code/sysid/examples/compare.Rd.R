library(sysid)


### Name: compare
### Title: Compare the measured output and the predicted output(s)
### Aliases: compare

### ** Examples

data(arxsim)
mod1 <- arx(arxsim,c(1,2,2))
mod2 <- oe(arxsim,c(2,1,1))
compare(arxsim,nahead=Inf,mod1,mod2)




