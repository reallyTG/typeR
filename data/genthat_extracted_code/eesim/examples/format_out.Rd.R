library(eesim)


### Name: format_out
### Title: Format output for custom model to use in eesim
### Aliases: format_out

### ** Examples

dat <- data.frame(x=rnorm(1000, 0, 1), outcome = rnorm(1000, 5, 1))
lin_mod <- lm(outcome~x, data=dat)
format_out(lin_mod)




