library(comperank)


### Name: offense-defense
### Title: Offense-Defense method
### Aliases: offense-defense rate_od rank_od

### ** Examples

rate_od(ncaa2005, mean(score1))

rank_od(ncaa2005, mean(score1))

rank_od(ncaa2005, mean(score1), keep_rating = TRUE)

# Account for self play
rate_od(ncaa2005, if(player1[1] == player2[1]) 0 else mean(score1))




