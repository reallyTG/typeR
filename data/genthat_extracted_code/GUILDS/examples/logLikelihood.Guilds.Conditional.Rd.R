library(GUILDS)


### Name: logLikelihood.Guilds.Conditional
### Title: Likelihood of the Guilds sampling formula, conditional on guild
###   size
### Aliases: logLikelihood.Guilds.Conditional

### ** Examples

exampleData <- generate.Guilds.Cond(theta = 200, alpha_x = 0.005, alpha_y = 0.001,
                                    JX = 1000, JY = 2000)
parametervals <- c(200,0.005,0.001) #theta = 200, alpha X = 0.005, alpha Y = 0.001
LL = logLikelihood.Guilds.Conditional(parametervals, model="D1",
				      exampleData$guildX, exampleData$guildY, verbose=TRUE)



