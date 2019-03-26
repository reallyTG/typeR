library(purging)


### Name: purge.probit
### Title: Purges mediator effects between two independent variables
###   (probit link function)
### Aliases: purge.probit

### ** Examples

df <- data.frame(A = rep(0:1, 20), B = 2:21) # probit/binary example
purge.probit(df, "A", "B")



