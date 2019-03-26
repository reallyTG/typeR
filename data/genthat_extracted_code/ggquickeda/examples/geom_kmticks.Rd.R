library(ggquickeda)


### Name: GeomKmticks
### Title: Display tick marks on a Kaplan Meier curve
### Aliases: GeomKmticks geom_kmticks
### Keywords: internal

### ** Examples

library(ggplot2)
sex <- rbinom(250, 1, .5)
df <- data.frame(time = exp(rnorm(250, mean = sex)), status = rbinom(250, 1, .75), sex = sex)
ggplot(df, aes(time = time, status = status, color = factor(sex))) + geom_km() + geom_kmticks()



