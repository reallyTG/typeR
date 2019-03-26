library(pubh)


### Name: jack_knife
### Title: Ranks leverage observations from Jackknife method.
### Aliases: jack_knife

### ** Examples

x <- rnorm(10, 170, 8)
x
mean(x)
jack_knife(x)

x <- rnorm(100, 170, 8)
mean(x)
head(jack_knife(x))



