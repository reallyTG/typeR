library(joineR)


### Name: to.balanced
### Title: Transform data to the longitudinal balanced format
### Aliases: to.balanced
### Keywords: data manip

### ** Examples

simul <- data.frame(num = 1:10,
                    Y1.1 = rnorm(10), Y1.2 = rnorm(10),
                    Y2.1 = rnorm(10), Y2.2 = rnorm(10),
                    age = rnorm(10))
simul <- to.unbalanced(simul, id.col = 1, times = c(1, 2), 
                       Y.col = 2:5, other.col = 6)
simul <- to.balanced(simul, id.col = "num", time.col = "time",
                     Y.col = c("Y1.1", "Y2.1"), other.col = "age")



