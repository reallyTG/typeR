library(soundgen)


### Name: getEnv
### Title: Get amplitude envelope
### Aliases: getEnv
### Keywords: internal

### ** Examples

a = rnorm(500) * seq(1, 0, length.out = 500)
plot(soundgen:::getEnv(a, 20))



