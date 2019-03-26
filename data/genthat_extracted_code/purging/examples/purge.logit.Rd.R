library(purging)


### Name: purge.logit
### Title: Purges mediator effects between two independent variables (logit
###   link function)
### Aliases: purge.logit

### ** Examples

df <- data.frame(A = rep(0:1, 20), B = 1:20) # logit/binary example
purge.logit(df, "A", "B")



