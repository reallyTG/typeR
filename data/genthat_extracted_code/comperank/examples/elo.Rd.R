library(comperank)


### Name: elo
### Title: Elo method
### Aliases: elo rate_elo rank_elo add_elo_ratings elo

### ** Examples

# Elo ratings
rate_elo(ncaa2005)

rank_elo(ncaa2005)

rank_elo(ncaa2005, keep_rating = TRUE)

add_elo_ratings(ncaa2005, initial_ratings = 100)

# Elo function
elo((0:12)*100, 1, 0, 0)
elo((0:12)*100, 1, 0, 0, K = 10)
elo((0:12)*10, 1, 0, 0, ksi = 40)




