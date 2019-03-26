library(psycho)


### Name: rope
### Title: Region of Practical Equivalence (ROPE)
### Aliases: rope

### ** Examples

library(psycho)

posterior <- rnorm(1000, 0, 0.01)
results <- rope(posterior)
results$decision



