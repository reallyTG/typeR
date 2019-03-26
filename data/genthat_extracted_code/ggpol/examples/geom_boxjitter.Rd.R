library(ggpol)


### Name: geom_boxjitter
### Title: A hybrid boxplot.
### Aliases: geom_boxjitter

### ** Examples

set.seed(221)
df <- data.frame(score = rgamma(150, 4, 1), 
                 gender = sample(c("M", "F"), 150, replace = TRUE), 
                 genotype = factor(sample(1:3, 150, replace = TRUE)))

ggplot(df) + geom_boxjitter(aes(x = gender, y = score, fill = genotype),
                            jitter.shape = 21, jitter.color = NA, 
                            jitter.height = 0, jitter.width = 0.04,
                            outlier.color = NA, errorbar.draw = TRUE) +
  scale_fill_manual(values = c("#CF3721", "#31A9B8", "#258039")) +
  theme_minimal()



