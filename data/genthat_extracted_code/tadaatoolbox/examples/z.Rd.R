library(tadaatoolbox)


### Name: z
### Title: Convert numeric vector to z-values
### Aliases: z

### ** Examples

x      <- rnorm(500, mean = 10, sd = 5)
z_vals <- z(x)
round(c(mean = mean(z_vals), sd = sd(z_vals)), 2)



