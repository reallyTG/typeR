library(GGally)


### Name: ggally_nostic_hat
### Title: ggnostic - leverage points
### Aliases: ggally_nostic_hat

### ** Examples

dt <- broomify(stats::lm(mpg ~ wt + qsec + am, data = mtcars))
ggally_nostic_hat(dt, ggplot2::aes(wt, .hat))



