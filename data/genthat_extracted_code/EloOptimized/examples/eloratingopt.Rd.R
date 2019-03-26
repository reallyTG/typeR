library(EloOptimized)


### Name: eloratingopt
### Title: Create daily ML fitted Elo ranks and multiple derivatives
### Aliases: eloratingopt

### ** Examples


nbadata = EloOptimized::nba #nba wins and losses from the 1995-96 season
nbaelo = eloratingopt(agon_data = nbadata, fit_init_elo = FALSE)
# generates optimized elo scores (optimizing only K) and saves them as "nbaelo" 




