library(JointAI)


### Name: densplot
### Title: Plot posterior density from JointAI model
### Aliases: densplot densplot.JointAI

### ** Examples


# fit a JointAI object:
mod <- lm_imp(y ~ C1 + C2 + M2, data = wideDF, n.iter = 100)

# Example 1: basic densityplot
densplot(mod)


# Example 2: use vlines to mark zero
densplot(mod, col = c("darkred", "darkblue", "darkgreen"),
         vlines = list(list(v = rep(0, nrow(summary(mod)$stats)),
                            col = grey(0.8))))


# Example 3: use vlines to visualize the posterior mean and 2.5% and 97.5% quantiles
densplot(mod, vlines = list(list(v = summary(mod)$stats[, "Mean"], lty = 1, lwd = 2),
                            list(v = summary(mod)$stats[, "2.5%"], lty = 2),
                            list(v = summary(mod)$stats[, "97.5%"], lty = 2)))


# Example 4: ggplot version
densplot(mod, use_ggplot = TRUE)


# Example 5: changing how the ggplot version looks (using standard ggplot syntax)
library(ggplot2)

densplot(mod, use_ggplot = TRUE) +
  xlab("value") +
  theme(legend.position = 'bottom') +
  scale_color_brewer(palette = 'Dark2', name = 'chain')





