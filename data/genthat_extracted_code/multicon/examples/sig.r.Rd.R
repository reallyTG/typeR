library(multicon)


### Name: sig.r
### Title: Significance Levels for Correlations
### Aliases: sig.r
### Keywords: q.cor significance

### ** Examples

	# A correlation of r=.15 with a sample of 100 is significant 
	#at p < .05 using a one-tailed t-test
sig.r(r=.15,n=200,tail=1) 
	# A correlation of r=.1 is trending toward significance at p < .1.
sig.r(r=.1,n=200,tail=1)	
	# Or it can be used on a vector. 
	#This is helpful for displaying significance levels of results.
v <- c( .1, .3, .4, .05, .04, .8)
sig.labels <- sig.r(v, 200, 1)
table1 <- data.frame(v, sig.labels)
colnames(table1) <- c("r", "sig level")
table1



