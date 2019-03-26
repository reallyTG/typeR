library(EloOptimized)


### Name: eloratingfixed
### Title: Create daily elo ranks and multiple derivatives with
###   user-defined parameter values
### Aliases: eloratingfixed

### ** Examples


nbadata = EloOptimized::nba #nba wins and losses from the 1995-96 season
nbaelo = eloratingfixed(agon_data = nbadata)
# generates traditional Elo scores (with init_elo = 1000 & k = 100) and saves 
#   them as "nbaelo" 




