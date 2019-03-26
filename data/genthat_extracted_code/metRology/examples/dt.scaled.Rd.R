library(metRology)


### Name: Scaled t distribution
### Title: Scaled and shifted t distribution.
### Aliases: dt.scaled pt.scaled qt.scaled rt.scaled
### Keywords: distribution

### ** Examples


	u<-rt.scaled(20, df=5, mean=11, sd=0.7)
	
	qt.scaled(c(0.025,0.975), Inf, mean=10, sd=1) #10 +- 1.96*sd
	
	require(graphics)
	hist(rt.scaled(10000, df=4, mean=11, sd=0.7), breaks=50, probability=TRUE)
	x<-seq(0,25, 0.05)
	lines(x,dnorm(x,mean=11, sd=0.7), col=2)




