library(BLRPM)


### Name: BL.acc
### Title: Accumulation of a precipitation stepfunction
### Aliases: BL.acc

### ** Examples

lambda <- 4/240
gamma <- 1/10
beta <- 0.3
eta <- 2
mux <- 4
t.sim <- 240
t.acc <- t.sim
acc.val <- 1
offset <- 0

simulation <- BL.sim(lambda,gamma,beta,eta,mux,t.sim)
sfn <- BL.stepfun(simulation$cells)
ts <- BL.acc(sfn,t.acc,acc.val,offset)



