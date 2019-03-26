library(GUILDS)


### Name: expected.SAD.Guilds
### Title: Estimate the expected species abundance distribution of both
###   guilds using the guilds model, provided theta, alpha_x, alpha_y and
###   J.
### Aliases: expected.SAD.Guilds

### ** Examples

  SADs <- expected.SAD.Guilds(theta=42, alpha_x=0.01, alpha_y=0.1, J=200, n_replicates = 1)
  par(mfrow=c(1,2));
  barplot(SADs$guildX,names.arg=0:(length(SADs$guildX)-1),
	  xlab="Number of individuals (log2)",
	  ylab="Number of Species",main="Guild X" )

  barplot(SADs$guildY,names.arg=0:(length(SADs$guildY)-1),
	  xlab="Number of individuals (log2)",
	  ylab="Number of Species",main="Guild Y" )




