library(reinforcelearn)


### Name: makeValueFunction
### Title: Value Function Representation
### Aliases: makeValueFunction

### ** Examples

val = makeValueFunction("table", n.states = 16L, n.actions = 4L)
# If the number of states and actions is not supplied, the agent will try
# to figure these out from the environment object during interaction.
val = makeValueFunction("table")



