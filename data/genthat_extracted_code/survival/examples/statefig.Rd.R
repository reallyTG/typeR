library(survival)


### Name: statefig
### Title: Draw a state space figure.
### Aliases: statefig
### Keywords: survival hplot

### ** Examples

# Draw a simple competing risks figure
states <- c("Entry", "Complete response", "Relapse", "Death")
connect <- matrix(0, 4, 4, dimnames=list(states, states))
connect[1, -1] <- c(1.1, 1, 0.9)
statefig(c(1, 3), connect)



