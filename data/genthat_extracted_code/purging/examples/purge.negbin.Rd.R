library(purging)


### Name: purge.negbin
### Title: Purges mediator effects between two independent variables
###   (negative binomial)
### Aliases: purge.negbin

### ** Examples

df <- data.frame(A = c(1,1,1,1,2,2,3,3,4,5), B = 1:10) # negative binomial/counts example
purge.negbin(df, "A", "B")



