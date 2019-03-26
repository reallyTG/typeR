library(survsup)


### Name: theme_km
### Title: Custom ggplot theme that make Kaplan-Meier curves look nice
### Aliases: theme_km

### ** Examples

library(survsup); library(ggplot2)
p <- ggplot(mtcars) + geom_point(aes(x = wt, y = mpg,
    colour = factor(gear))) + facet_wrap(~am)

p + theme_km()



