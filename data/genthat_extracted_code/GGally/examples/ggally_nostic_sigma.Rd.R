library(GGally)


### Name: ggally_nostic_sigma
### Title: ggnostic - leave one out model sigma
### Aliases: ggally_nostic_sigma

### ** Examples

dt <- broomify(stats::lm(mpg ~ wt + qsec + am, data = mtcars))
ggally_nostic_sigma(dt, ggplot2::aes(wt, .sigma))



