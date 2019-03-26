library(pammtools)


### Name: geom_stepribbon
### Title: Step ribbon plots.
### Aliases: geom_stepribbon GeomStepribbon
### Keywords: datasets

### ** Examples

library(ggplot2)
huron <- data.frame(year = 1875:1972, level = as.vector(LakeHuron))
h <- ggplot(huron, aes(year))
h + geom_stepribbon(aes(ymin = level - 1, ymax = level + 1), fill = "grey70") +
    geom_step(aes(y = level))
h + geom_ribbon(aes(ymin = level - 1, ymax = level + 1), fill = "grey70") +
    geom_line(aes(y = level))



