library(GUILDS)


### Name: expected.SAD
### Title: Calculate the expected species abundance distribution of the
###   standard neutral model, given theta, m and J
### Aliases: expected.SAD

### ** Examples

SAD <- expected.SAD(theta=42, m = 0.1, J = 200);
barplot(SAD,names.arg=0:(length(SAD)-1),
	xlab="Number of individuals (log2)",
	ylab="Number of Species" )



