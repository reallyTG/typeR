library(ssym)


### Name: Claims
### Title: Personal Injure Insurance
### Aliases: Claims

### ** Examples

data("Claims", package="ssym")
plot(Claims$op_time, Claims$total, type="p", cex=0.3, lwd=3,
     ylab="Amount of paid money", xlab="Operational time",
	 main="Personal Injure Insurance Data")



