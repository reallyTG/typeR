library(metafolio)


### Name: ricker
### Title: A simple Ricker model
### Aliases: ricker

### ** Examples

S <- seq(100, 1000, length.out = 100)
R <- ricker(S, a = 1.9, b = 900)
plot(S, R)



