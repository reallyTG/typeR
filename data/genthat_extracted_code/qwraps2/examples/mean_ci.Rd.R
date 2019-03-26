library(qwraps2)


### Name: mean_ci
### Title: Means and Confidence Intervals
### Aliases: mean_ci print.qwraps2_mean_ci

### ** Examples

# using the standard normal for the CI
mean_ci(mtcars$mpg)

# print it nicely
qwraps2::frmtci(mean_ci(mtcars$mpg))
qwraps2::frmtci(mean_ci(mtcars$mpg), show_level = TRUE)
qwraps2::frmtci(mean_ci(mtcars$mpg, alpha = 0.01), show_level = TRUE)

# Compare to the ci that comes form t.test
t.test(mtcars$mpg)
t.test(mtcars$mpg)$conf.int
mean_ci(mtcars$mpg, qdist = stats::qt, qdist.args = list(df = 31))

# geometric version
mean_ci(log(mtcars$mpg), transform = exp, qdist = stats::qt, qdist.args = list(df = 31))




