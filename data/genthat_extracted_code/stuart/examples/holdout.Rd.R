library(stuart)


### Name: holdout
### Title: Data selection for holdout validation.
### Aliases: holdout

### ** Examples


# seeded selection, 25% validation sample
data(fairplayer)
split <- holdout(fairplayer, .75, seed = 55635)
lapply(split, nrow) # check size of samples




