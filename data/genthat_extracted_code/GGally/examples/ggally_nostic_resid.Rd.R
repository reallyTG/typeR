library(GGally)


### Name: ggally_nostic_resid
### Title: ggnostic - residuals
### Aliases: ggally_nostic_resid

### ** Examples

dt <- broomify(stats::lm(mpg ~ wt + qsec + am, data = mtcars))
ggally_nostic_resid(dt, ggplot2::aes(wt, .resid))



