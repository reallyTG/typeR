library(fastR)


### Name: mathnoise
### Title: Test performance and noise
### Aliases: mathnoise
### Keywords: datasets

### ** Examples


data(mathnoise)
xyplot(score~noise, data=mathnoise, group=group, type='a', 
		auto.key=list(columns=2, lines=TRUE, points=FALSE))




