library(pubh)


### Name: reference_range
### Title: Reference range (reference interval).
### Aliases: reference_range

### ** Examples

x <- rnorm(100, 170, 8)
round(mean(x), 2)
round(sd(x), 2)

round(reference_range(mean(x), sd(x)), 2)



