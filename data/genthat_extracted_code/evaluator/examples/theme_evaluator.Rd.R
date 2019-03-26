library(evaluator)


### Name: theme_evaluator
### Title: Default ggplot theme used by all Evaluator-supplied graphics
### Aliases: theme_evaluator

### ** Examples

library(ggplot2)
p <- ggplot(mtcars) + geom_point(aes(wt, mpg, color = factor(gear))) + facet_wrap(~am)
font_family <- get_base_fontfamily()
p + theme_evaluator(font_family)



