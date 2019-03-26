library(RStorm)


### Name: RStorm-package
### Title: Simulate a Streaming Process in [R]
### Aliases: RStorm-package

### ** Examples


##############################
# a simple stream to compute a sum:
##############################

# create some data:
x <- seq(1, 1000)

# start a topology
topology <- Topology(data.frame(x=x))

# define a bolt and add it to the topology
computeSum <- function(x, ...){
	sum <- GetHash("sum")
	if(is.data.frame(sum)){
		x <- sum + (x[1])
	}
	SetHash("sum", x)
}
topology <- AddBolt(topology, Bolt(computeSum))

# Run the stream:
result <- RStorm(topology)

# Inspect the result
print(GetHash("sum", result))

#plot(topology)


##############################
# Example of a stream to compare two 
# methods of streaming variance computation:
##############################

# Generate some data 
set.seed(10)
t <- 100
x <- rnorm(t,0,1)
# Look at the variance as computed by var():
var(x)

# Start a topology
topology <- Topology(data.frame(x=x))

# Bolt for "Sum of Squares Method" with tracking over time
var.SS <- function(x, ...){
	params <- GetHash("params1")
	if(!is.data.frame(params)){
		params <- list()
		params$n <- params$sum <- params$sum2 <- 0
	}
	n <- params$n + 1
	sum <- params$sum + as.numeric(x[1])
	sum2 <- params$sum2 + as.numeric(x[1]^2)
	if(n>1){
		var <- 1/(n*(n-1)) * (n*sum2 - sum^2)
	} else {
		var <- 0
	}
	SetHash("params1", data.frame(n=n, sum=sum, sum2=sum2, var=var))
	TrackRow("var.SS", data.frame(var=var))
}


## Bolt for "Welford's" Method:

var.Welford <- function(x, ...){
	x <- as.numeric(x[1])
	params <- GetHash("params2")
	if(!is.data.frame(params)){
		params <- list()
		params$M <- x
		params$S <- params$n <- 0
	}
	n <- params$n + 1
	M <- params$M + ( x - params$M) / n
	S <- params$S + (x - params$M)*(x-M)

	if(n>1){
		var <- S / (n-1)
	} else {
		var <- 0
	}
	SetHash("params2", data.frame(n=n, M=M, S=S, var=var))
	TrackRow("var.Welford", data.frame(var=var))
}

# Add both topologies to a Stream:
topology <- AddBolt(topology, Bolt(var.SS))
topology <- AddBolt(topology, Bolt(var.Welford))
result <- RStorm(topology)

# Plot the results over the stream
plot(c(1:t), GetTrack("var.Welford", result)$var, type="l")
lines(c(1:t), GetTrack("var.SS", result)$var, col="red")


### Similar, but with a dataset
###  in which the mean is very large compared to the variance:
x2 <- rnorm(t,10^8,1)
topology2 <- Topology(data.frame(x=x2))
topology2 <- AddBolt(topology2, Bolt(var.SS))
topology2 <- AddBolt(topology2, Bolt(var.Welford))
result2 <- RStorm(topology2)

# This time the standard SS methods screws up (mind the different y scale):
# (And mind the fact that the SS method gives NEGATIVE variance)
plot(c(1:t), GetTrack("var.Welford", result2)$var, type="l", ylim=c(-10, 11))
lines(c(1:t), GetTrack("var.SS", result2)$var, col="red")





