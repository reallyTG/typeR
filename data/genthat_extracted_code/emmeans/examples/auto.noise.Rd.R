library(emmeans)


### Name: auto.noise
### Title: Auto Pollution Filter Noise
### Aliases: auto.noise
### Keywords: datasets

### ** Examples

noise.lm <- lm(noise ~ size * type * side, data = auto.noise)

# Interaction plot of predictions
emmip(noise.lm, type ~ size | side)

# Confidence intervals
plot(emmeans(noise.lm, ~ size | side*type))




