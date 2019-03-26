library(trueskill)


### Name: trueskill-package
### Title: Implementation of the TrueSkill algorithm
### Aliases: trueskill-package trueskill
### Keywords: package trueskill

### ** Examples

  # Example 1.
  
  # set default values for BETA, EPSILON and GAMMA where BETA is sigma / 2
  # EPSILON is DrawProbability(0.1)
  # GAMMA is sigma / 100
  parameters <- Parameters$new()
  
  Alice  <- Player(rank = 1, skill = Gaussian(mu = 25, sigma = 25 / 3), name = "1")
  Bob    <- Player(rank = 2, skill = Gaussian(mu = 25, sigma = 25 / 3), name = "2")
  Chris  <- Player(rank = 2, skill = Gaussian(mu = 25, sigma = 25 / 3), name = "3")
  Darren <- Player(rank = 4, skill = Gaussian(mu = 25, sigma = 25 / 3), name = "4") 
   
  players <- list(Alice, Bob, Chris, Darren)
  
  players <- AdjustPlayers(players, parameters)  
  PrintList(players)
  print(Alice$skill)

  # Relying on positional arguments looks much cleaner:
  Alice  <- Player(1, Gaussian(25, 8.3), "Alice")
  Bob    <- Player(2, Gaussian(25, 8.3), "Bob")
  Chris  <- Player(2, Gaussian(25, 8.3), "Chris")
  Darren <- Player(4, Gaussian(25, 8.3), "Darren") 
 
  # Example 2 - see https://gist.github.com/bhoung/5596282  
  # the example applies trueskill to tennis tournament data
  # (runtime is approx 50 secs)
  



