library(GUILDS)


### Name: logLikelihood.Guilds
### Title: Likelihood of the Guilds sampling formula
### Aliases: logLikelihood.Guilds

### ** Examples

exampleData <- generate.Guilds(theta = 200, alpha_x = 0.005, alpha_y = 0.001, 
                               J = 1000)
parametervals <- c(200, 0.005, 0.001) #theta = 200, alpha X = 0.005, alpha Y = 0.001
LL = logLikelihood.Guilds(parametervals, model = "D1",
			  exampleData$guildX, exampleData$guildY, verbose = TRUE)



