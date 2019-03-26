library(tailloss)


### Name: ELT
### Title: Event Loss Table
### Aliases: ELT

### ** Examples

rate <- c(.1, .02, .05)
loss <- c(2, 5, 7)

ELT(Rate = rate, Loss = loss)
# Same as
rl <- data.frame(Rate = rate, Loss = loss)
ELT(rl)



