library(BSDA)


### Name: Dice
### Title: Outcomes and probabilities of the roll of a pair of fair dice
### Aliases: Dice
### Keywords: datasets

### ** Examples


roll1 <- sample(1:6, 20000, replace = TRUE)
roll2 <- sample(1:6, 20000, replace = TRUE)
outcome <- roll1 + roll2
T1 <- table(outcome)/length(outcome)
remove(roll1, roll2, outcome)
T1
round(t(Dice), 5)
rm(roll1, roll2, T1)




