library(quantreg)


### Name: dither
### Title: Function to randomly perturb a vector
### Aliases: dither
### Keywords: manip

### ** Examples

x <- rlnorm(40)
y <- rpois(40, exp(.5 + log(x)))
f <- rq(dither(y, type = "right", value = 1) ~ x)



