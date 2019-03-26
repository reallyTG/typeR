library(MKmisc)


### Name: normCI
### Title: Confidence Intervals for Mean and Standard Deviation
### Aliases: normCI
### Keywords: univar

### ** Examples

x <- rnorm(50)
## mean and sd unknown
normCI(x)
## sd known
normCI(x, sd = 1)
## mean known
normCI(x, mean = 0)



