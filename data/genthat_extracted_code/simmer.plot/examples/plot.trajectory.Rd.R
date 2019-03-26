library(simmer.plot)


### Name: plot.trajectory
### Title: Plot Method for 'trajectory' Objects
### Aliases: plot.trajectory

### ** Examples

x <- trajectory() %>%
  seize("res", 1) %>%
  timeout(1) %>%
  release("res", 1) %>%
  rollback(3)

plot(x)



