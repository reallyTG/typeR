library(trueskill)


### Name: AdjustPlayers
### Title: Update the Skills of a List of Players
### Aliases: AdjustPlayers

### ** Examples

  Alice  <- Player(rank = 1, skill = Gaussian(mu = 25, sigma = 25 / 3), name = "1")
  Bob    <- Player(rank = 2, skill = Gaussian(mu = 25, sigma = 25 / 3), name = "2")
  Chris  <- Player(rank = 2, skill = Gaussian(mu = 25, sigma = 25 / 3), name = "3")
  Darren <- Player(rank = 4, skill = Gaussian(mu = 25, sigma = 25 / 3), name = "4") 
   
  players <- list(Alice, Bob, Chris, Darren)
  
  parameters <- Parameters$new()
  players <- AdjustPlayers(players, parameters) 		



