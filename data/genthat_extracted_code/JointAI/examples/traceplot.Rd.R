library(JointAI)


### Name: traceplot
### Title: Traceplot of a JointAI model
### Aliases: traceplot traceplot.JointAI

### ** Examples

# fit a JointAI model
mod <- lm_imp(y~C1 + C2 + M2, data = wideDF, n.iter = 100)


# Example 1: simple traceplot
traceplot(mod)


# Example 2: ggplot version of traceplot
traceplot(mod, use_ggplot = TRUE)


# Example 5: changing how the ggplot version looks (using standard ggplot syntax)
library(ggplot2)

traceplot(mod, use_ggplot = TRUE) +
  theme(legend.position = 'botto') +
  xlab('iteration') +
  ylab('value') +
  scale_color_discrete(name = 'chain')





