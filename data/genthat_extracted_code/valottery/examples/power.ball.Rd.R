library(valottery)


### Name: power.ball
### Title: Power Ball
### Aliases: power.ball
### Keywords: datasets

### ** Examples

## According to game rules, the powerball is numbered 1 - 35,
## but apparently there were times when it went up to 39
i <- power.ball$powerball > 35
any(i)
sum(i)
power.ball$powerball[i]



