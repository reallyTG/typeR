library(EvolutionaryGames)


### Name: phaseDiagram3S
### Title: Phase Diagram for two-player games with three strategies
### Aliases: phaseDiagram3S

### ** Examples

A <- matrix(c(0, -2, 1, 1, 0, -2, -2, 1, 0), 3, byrow=TRUE)
state <- matrix(c(0.4, 0.3, 0.3), 1, 3, byrow=TRUE)

phaseDiagram3S(A, Replicator, NULL, state, FALSE, FALSE)
phaseDiagram3S(A, Replicator, NULL, state, TRUE, TRUE)

# Plot two trajectories rather than only one:
A <- matrix(c(0, -2, 1, 1, 0, -2, -2, 1, 0), 3, byrow=TRUE)
state <- matrix(c(0.4, 0.3, 0.3, 0.6, 0.2, 0.2), 2, 3, byrow=TRUE)
phaseDiagram3S(A, Replicator, NULL, state, FALSE, FALSE)



