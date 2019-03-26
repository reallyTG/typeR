library(GGally)


### Name: ggally_nostic_std_resid
### Title: ggnostic - standardized residuals
### Aliases: ggally_nostic_std_resid

### ** Examples

dt <- broomify(stats::lm(mpg ~ wt + qsec + am, data = mtcars))
ggally_nostic_std_resid(dt, ggplot2::aes(wt, .std.resid))



