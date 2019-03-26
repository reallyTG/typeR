library(broom)


### Name: tidy_svd
### Title: Tidy a(n) svd object masquerading as list
### Aliases: tidy_svd svd_tidiers

### ** Examples


mat <- scale(as.matrix(iris[, 1:4]))
s <- svd(mat)

tidy_u <- tidy(s, matrix = "u")
tidy_u

tidy_d <- tidy(s, matrix = "d")
tidy_d

tidy_v <- tidy(s, matrix = "v")
tidy_v

library(ggplot2)
library(dplyr)

ggplot(tidy_d, aes(PC, percent)) +
    geom_point() +
    ylab("% of variance explained")

tidy_u %>%
    mutate(Species = iris$Species[row]) %>%
    ggplot(aes(Species, value)) +
    geom_boxplot() +
    facet_wrap(~ PC, scale = "free_y")





