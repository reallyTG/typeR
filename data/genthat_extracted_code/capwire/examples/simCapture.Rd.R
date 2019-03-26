library(capwire)


### Name: simCapture
### Title: Simulate data under various distributions of capture rates
### Aliases: simCapture

### ** Examples

## Specify that capture probabilities are drawn from a uniform distribution

rates <- drawCapRatesUnif(lower=0.1, upper=1)

## Simulate data using the specified distribution

data <- simCapture(n=20, s=100, dist.func=rates, return.cap.probs=FALSE)

data

## Example of sampling capture probabilities from a non-standard distribution
## We want to use a truncated normal for this purpose

## Create a function which takes argumens mean, sd, and trunc.point
drawCapRates.truncnorm <- function(mean, sd, trunc.point){
	
	## Draw a large number of samples from a normal distribution with specified mean and sd
	normal.dist <- rnorm(100000, mean, sd)
	
	## Truncate the distribution at the point specified by trunc.point
	trunc.dist <- normal.dist[which(normal.dist >= trunc.point)]
	
	## Create a function which draws n samples from trunc.dist
	function(n){
		sample(trunc.dist, size=n, replace=TRUE)
	}
	
}

## Specify the distribution

my.dist <- drawCapRates.truncnorm(mean=2, sd=1, trunc.point=0)

## Look at the function that is returned

my.dist

## Simulate data under the specified distribution

my.data <- simCapture(n=20, s=100, dist.func=my.dist, return.cap.probs=TRUE)

my.data




