library(reinforcelearn)


### Name: interact
### Title: Interaction between agent and environment.
### Aliases: interact

### ** Examples

env = makeEnvironment("windy.gridworld")
agent = makeAgent("softmax", "table", "qlearning")
interact(env, agent, n.episodes = 10L)



