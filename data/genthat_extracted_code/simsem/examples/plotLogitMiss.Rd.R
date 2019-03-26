library(simsem)


### Name: plotLogitMiss
### Title: Visualize the missing proportion when the logistic regression
###   method is used.
### Aliases: plotLogitMiss

### ** Examples

script <- 'y1 ~ 0.05 + 0.1*y2 + 0.3*y3
	y4 ~ -2 + 0.1*y4
	y5 ~ -0.5' 
plotLogitMiss(script)

script2 <- 'y1 ~ 0.05 + 0.5*y3
	y2 ~ p(0.2)
	y3 ~ p(0.1) + -1*y1
	y4 ~ p(0.3) + 0.2*y1 + -0.3*y2
	y5 ~ -0.5' 
plotLogitMiss(script2)



