library(trueskill)


### Name: Parameters
### Title: Sets three parameters used in the TrueSkill algorithm.
### Aliases: Parameters

### ** Examples

  parameters <- Parameters()
  
  # alternatively and equiavelently
  draw_margin <-DrawMargin(draw_probability = 0.10, beta = 25 / 6, total_players = 2)
  parameters <- Parameters(beta = 25 / 6, epsilon = draw_margin, gamma = 25 / 300)



