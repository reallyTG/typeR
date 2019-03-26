library(purging)


### Name: purge.lm
### Title: Purges mediator effects between two independent variables
###   (linear)
### Aliases: purge.lm

### ** Examples

df <- data.frame(A = 1:10, B = 2:11) # linear/continuous example
purge.lm(df, "A", "B")



