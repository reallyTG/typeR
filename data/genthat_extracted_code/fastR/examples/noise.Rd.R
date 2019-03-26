library(fastR)


### Name: noise
### Title: Noise - unfinished documentation
### Aliases: noise
### Keywords: datasets

### ** Examples


data(noise)
noise2 <- noise[noise$volume != 'none',] 
model <- lm(score~volume*frequency, data=noise2) 
anova(model)
xyplot(score~volume,noise2, groups=frequency, type='a',
		auto.key=list(columns=2, points=FALSE, lines=TRUE))




