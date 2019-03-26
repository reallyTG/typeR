library(sppmix)


### Name: rnormmix
### Title: Generate a mixture with normal components
### Aliases: rnormmix

### ** Examples

## No test: 
mix1 <- rnormmix(m = 3, sig0 = .1, df = 5)
summary(mix1)
mix2 <- rnormmix(m = 5, sig0 = .1, df = 5, rand_m = TRUE, ylim = c(0, 5))
summary(mix2)
## End(No test)




