library(statsr)


### Name: bandit_sim
### Title: Run the Bandit Simulation shiny app
### Aliases: bandit_sim

### ** Examples

if (interactive()) {
# run interactive shiny app to generate wins and losses
bandit_sim()
}
# paste data from the shiny app into varible
data = data.frame(
 machine = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
   1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 
   2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L,
   2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L,
   2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 
   1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L,
   2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 
   1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 1L, 1L, 1L, 1L, 1L), 
 outcome = c("W", "W", "W", "L", "W", "W", "W", "L", "W", "L", "W", "L",
  "L", "L", "W", "L", "W", "L", "L", "L", "W", "W", "W", "L", "L", "L", 
  "L", "L", "W", "W", "L", "L", "W", "L", "L", "W", "L", "L", "W", "L",
  "L", "L", "L", "L", "W", "L", "L", "W", "W", "W", "W", "L", "L", "L",
  "L", "L", "L", "W", "L", "W", "L", "W", "L", "L", "L", "L", "L", "L", "L",
  "L", "L", "L", "W", "W", "W", "L", "W", "L", "L", "L", "L", "L", "L", "L",
  "L", "L", "L", "W", "W", "W", "W", "W", "L", "W", "W", "L", "W", "L", "L",
  "L", "L", "L", "W", "L", "W", "L", "L", "L", "W", "W", "W", "W", "L", "L",
  "W", "L", "W", "L", "L", "W"))
  bandit_posterior(data)
  plot_bandit_posterior(data)




