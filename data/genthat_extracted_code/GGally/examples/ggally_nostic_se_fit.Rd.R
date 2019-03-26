library(GGally)


### Name: ggally_nostic_se_fit
### Title: ggnostic - fitted value standard error
### Aliases: ggally_nostic_se_fit

### ** Examples

dt <- broomify(stats::lm(mpg ~ wt + qsec + am, data = mtcars))
ggally_nostic_se_fit(dt, ggplot2::aes(wt, .se.fit))



