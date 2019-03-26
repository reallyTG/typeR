library(PlayerRatings)


### Name: glicko2
### Title: The Glicko-2 Rating System
### Aliases: glicko2
### Keywords: models

### ** Examples

initstate <- data.frame(Player=1:4, Rating = c(1500,1400,1550,1700), 
  Deviation = c(200,30,100,300), Volatility = 0.06)
games <- data.frame(Week = 1, Payer1 = 1, Player2 = 2:4, Score = c(1,0,0))
robj <- glicko2(games, status = initstate, tau = 0.5, sort = FALSE)
print(robj, cols = 1:4, digits = 6)

afl <- aflodds[,c(2,3,4,7)]
robj <- glicko2(afl)
robj

robj <- glicko2(afl[afl$Week==1,])
for(i in 2:max(afl$Week)) robj <- glicko2(afl[afl$Week==i,], robj$ratings)
robj



