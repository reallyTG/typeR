library(openintro)


### Name: student.sleep
### Title: Sleep for 110 students (simulated)
### Aliases: student.sleep
### Keywords: datasets

### ** Examples

data(student.sleep)

set.seed(2)
x <- exp(c(rnorm(100, log(7.5), 0.15),
           rnorm(10, log(10), 0.196)))
x <- round(x - mean(x) + 7.42, 2)

identical(x, student.sleep$hours)



