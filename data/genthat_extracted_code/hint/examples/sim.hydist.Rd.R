library(hint)


### Name: sim.hydist
### Title: Simulating the Drawing of Distinct Categories
### Aliases: sim.hydist

### ** Examples

## All n categories contain duplicates:
nn <- sim.hydist(108, 74, sims = 10)
## Duplicates in 78 of the categories:
nn <- sim.hydist(108, 74, sims = 10, Na = c(rep(1,(108-78)),rep(2,78)))



