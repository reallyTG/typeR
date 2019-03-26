library(GUILDS)


### Name: expected.SAD.Guilds.Conditional
### Title: Estimate the expected species abundance distribution of both
###   guilds using the guilds model, provided theta, alpha_x, alpha_y,
###   conditional on the size of guild X, Jx and the size of guild Y, Jy.
### Aliases: expected.SAD.Guilds.Conditional

### ** Examples

  SADs <- expected.SAD.Guilds.Conditional(theta = 42, alpha_x = 0.01, alpha_y = 0.1, 
				          Jx = 200, Jy = 100, n_replicates = 1)

  par(mfrow=c(1,2))
  barplot(SADs$guildX, names.arg=0:(length(SADs$guildX) - 1),
	  xlab = "Number of individuals (log2)",
	  ylab = "Number of Species", main = "Guild X" )
  barplot(SADs$guildY, names.arg = 0:(length(SADs$guildY) - 1),
	  xlab = "Number of individuals (log2)",
	  ylab = "Number of Species", main = "Guild Y" )



