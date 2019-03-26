library(BaPreStoPro)


### Name: InvMethod
### Title: Inversion Method
### Aliases: InvMethod

### ** Examples

test <- InvMethod(function(x) pnorm(x, 5, 1), 1000, candArea = c(0, 10), method = "free")
plot(density(test))
curve(dnorm(x, 5, 1), col = 2, add = TRUE)



