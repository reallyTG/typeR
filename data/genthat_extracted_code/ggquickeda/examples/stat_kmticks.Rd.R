library(ggquickeda)


### Name: StatKmticks
### Title: Compute locations for tick marks
### Aliases: StatKmticks stat_kmticks
### Keywords: internal

### ** Examples

library(ggplot2)
sex <- rbinom(250, 1, .5)
df <- data.frame(time = exp(rnorm(250, mean = sex)), status = rbinom(250, 1, .75), sex = sex)
ggplot(df, aes(time = time, status = status, color = factor(sex))) +
 stat_km() + stat_kmticks()




