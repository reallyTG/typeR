library(gastempt)


### Name: simulate_gastempt
### Title: Simulate gastric emptying data following a linexp or powexp
###   function
### Aliases: simulate_gastempt

### ** Examples

set.seed(4711)
library(ggplot2)
vol_linexp = simulate_gastempt(n_records = 4, noise = 20)
ggplot(vol_linexp$data, aes(x = minute, y = vol)) + geom_point() +
  facet_wrap(~record) + ggtitle("linexp, noise = 0, no missing")

vol_powexp = simulate_gastempt(n_records = 4, missing = 0.2, student_t_df = 2)
ggplot(vol_powexp$data, aes(x = minute, y = vol)) + geom_point() +
  facet_wrap(~record) + ggtitle("powexp, noise = 10 (default), 20% missing,
  Student-t (df = 2) noise")



