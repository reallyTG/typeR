library(pid)


### Name: paretoPlot
### Title: Pareto plot (coefficient plot) for a factorial design model
### Aliases: paretoPlot pareto.plot

### ** Examples

# 2-factor example
T <- c(-1, +1, -1, +1)  # centered and scaled temperature
S <- c(-1, -1, +1, +1)  # centered and scaled speed variable
y <- c(69, 60, 64, 53)  # conversion, is our response variable, y
doe.model <- lm(y ~ T + S + T * S)  # create a model with main effects, and interaction
paretoPlot(doe.model)

# 3-factor example
data(pollutant)
mod.full <- lm(y ~ C*T*S, data=pollutant)
paretoPlot(mod.full)



