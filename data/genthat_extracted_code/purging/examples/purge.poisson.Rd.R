library(purging)


### Name: purge.poisson
### Title: Purges mediator effects between two independent variables
###   (Poisson)
### Aliases: purge.poisson

### ** Examples

df <- data.frame(A = c(1,1,1,1,1,2,2,2,3,4), B = 1:10) # Poisson/counts example
purge.poisson(df, "A", "B")



