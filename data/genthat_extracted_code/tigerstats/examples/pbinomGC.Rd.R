library(tigerstats)


### Name: pbinomGC
### Title: Graphical Calculator for Binomial Curve Probabilities
### Aliases: pbinomGC

### ** Examples

#This gives P(X <= 6) for binom X with 10 trials, chance of success 0.70 on each trial:
pbinomGC(6,region="below",size=10,prob=0.70)

#This gives P(45 <= X <= 55), where X is binom with 100 trials,
#chance of success on each trial p = 0.50:
pbinomGC(c(45,55),region="between",size=100,prob=0.50)

#This gives P(X >= 7) = P(X > 6), for binom X with 10 trials,
#70% chance of success on each trial
pbinomGC(6,region="above",size=10,prob=0.7)



