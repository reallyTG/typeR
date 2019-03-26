library(trueskill)


### Name: DrawMargin
### Title: EPSILON or draw margin, used to set EPSILON in Parameters
### Aliases: DrawMargin

### ** Examples

  draw_margin <-DrawMargin(draw_probability = 0.10, beta = 25 / 6, total_players = 2)
  parameters <- Parameters(beta = 25 / 6, epsilon = draw_margin, gamma = 25 / 300)



