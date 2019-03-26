library(mlf)


### Name: boot
### Title: Bootstrap Confidence Intervals via Resampling
### Aliases: boot

### ** Examples

# Sample data
a <- rnorm(25, 80, 35)
b <- rnorm(25, 100, 50)

mlf::mic(a, b)
mlf::boot(a, b, mic)



