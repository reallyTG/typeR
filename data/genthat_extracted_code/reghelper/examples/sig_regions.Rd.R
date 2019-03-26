library(reghelper)


### Name: sig_regions
### Title: Regions of significance for an interaction.
### Aliases: sig_regions sig_regions.lm sig_regions.glm

### ** Examples

# mtcars data
mtcars$am <- factor(mtcars$am)  # make 'am' categorical
model <- lm(mpg ~ wt * am, data=mtcars)
summary(model)  # significant interaction
sig_regions(model)



