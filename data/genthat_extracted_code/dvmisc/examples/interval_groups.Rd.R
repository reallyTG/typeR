library(dvmisc)


### Name: interval_groups
### Title: Split Continuous Variable into Equal-Width Groups
### Aliases: interval_groups

### ** Examples

# Convert values from N(0, 1) into 6 equal-width groups
x <- rnorm(1000)
groups <- interval_groups(x, 6)
table(groups)

# Use interval_groups to detect non-linearity
set.seed(123)
x <- rnorm(1000)
y <- 1.5 + 1.25 * x + 0.25 * x^2 + rnorm(1000)
plot(tapply(y, interval_groups(x), mean))




