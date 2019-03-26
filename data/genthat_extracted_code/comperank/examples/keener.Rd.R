library(comperank)


### Name: keener
### Title: Keener method
### Aliases: keener rate_keener rank_keener skew_keener normalize_keener

### ** Examples

rate_keener(ncaa2005, sum(score1))

rank_keener(ncaa2005, sum(score1))

rank_keener(ncaa2005, sum(score1), keep_rating = TRUE)

# Impact of skewing
rate_keener(ncaa2005, sum(score1), skew_fun = NULL)

# Impact of normalization.
rate_keener(ncaa2005[-(1:2), ], sum(score1))

rate_keener(ncaa2005[-(1:2), ], sum(score1), normalize_fun = NULL)




