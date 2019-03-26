library(GGally)


### Name: ggally_nostic_cooksd
### Title: ggnostic - Cook's distance
### Aliases: ggally_nostic_cooksd

### ** Examples

dt <- broomify(stats::lm(mpg ~ wt + qsec + am, data = mtcars))
ggally_nostic_cooksd(dt, ggplot2::aes(wt, .cooksd))



