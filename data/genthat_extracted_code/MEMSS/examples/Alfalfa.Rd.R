library(MEMSS)


### Name: Alfalfa
### Title: Split-Plot Experiment on Varieties of Alfalfa
### Aliases: Alfalfa
### Keywords: datasets

### ** Examples

str(Alfalfa)
(m1 <- lmer(Yield ~ Variety * Date + (1|Block), Alfalfa, verbose = TRUE))



