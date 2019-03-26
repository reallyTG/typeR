library(pubh)


### Name: ss_jk
### Title: Sum of squares for Jackknife.
### Aliases: ss_jk

### ** Examples

x <- rnorm(10, 170, 8)
x
mean(x)
ss_jk(x, mean(x))
jack_knife(x)



