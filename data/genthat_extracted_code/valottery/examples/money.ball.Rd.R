library(valottery)


### Name: money.ball
### Title: $1,000,000 Money Ball
### Aliases: money.ball
### Keywords: datasets

### ** Examples

## probability of drawing money ball before first 5 balls
(1/36) + (1/35) + (1/34) + (1/33) + (1/32)
## observed money ball results
prop.table(table(money.ball$moneyball))
## simulate money ball draws before first 5 draws
set.seed(123)
mean(replicate(1000, any(sample(c(1:35,"mb"),5)=="mb")))



