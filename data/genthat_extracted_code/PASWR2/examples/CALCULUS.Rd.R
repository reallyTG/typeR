library(PASWR2)


### Name: CALCULUS
### Title: Calculus Assessment Scores
### Aliases: CALCULUS
### Keywords: datasets

### ** Examples

# ggplot2 approach
ggplot(data = CALCULUS, aes(sample = score)) + stat_qq() + facet_grid(. ~ calculus)
ggplot(data = CALCULUS, aes(x = calculus, y = score, fill = calculus)) + geom_boxplot() + 
guides(fill = FALSE) + scale_fill_brewer()
ggplot(data = CALCULUS, aes(sample = score, color = calculus)) + stat_qq()
# lattice approach
qqmath(~score|calculus, data = CALCULUS)
qqmath(~score, group = calculus, type = c('p', 'r'), auto.key=TRUE, data = CALCULUS)



