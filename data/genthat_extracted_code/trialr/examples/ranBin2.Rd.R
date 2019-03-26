library(trialr)


### Name: ranBin2
### Title: Sample pairs of correlated binary events
### Aliases: ranBin2

### ** Examples

probs <- c(0.8, 0.3)
s <- ranBin2(1000, probs, psi=0.2)  # 1000 pairs of outcomes
cor(s)  # Negatively correlated because psi < 1
colMeans(s)  # Event rates as expected



