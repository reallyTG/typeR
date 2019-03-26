library(PASWR2)


### Name: AGGRESSION
### Title: TV and Behavior
### Aliases: AGGRESSION
### Keywords: datasets

### ** Examples

AL <- reshape(AGGRESSION, varying = c("violence", "noviolence"), 
v.names = "aggression", direction = "long")
ggplot(data = AL, aes(x = factor(time), y = aggression, fill = factor(time))) + 
geom_boxplot() + labs(x = "") + scale_x_discrete(breaks = c(1, 2), 
labels = c("Violence", "No Violence")) + guides(fill = FALSE) + scale_fill_brewer()
rm(AL)
with(data = AGGRESSION, 
wilcox.test(violence, noviolence, paired = TRUE, alternative = "greater"))



