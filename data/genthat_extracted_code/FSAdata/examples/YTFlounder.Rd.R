library(FSAdata)


### Name: YTFlounder
### Title: Ages of Yellowtail Flounder assigned from scales and otoliths.
### Aliases: YTFlounder
### Keywords: datasets

### ** Examples

data(YTFlounder)
str(YTFlounder)
head(YTFlounder)
op <- par(mfrow=c(2,2),pch=19)
plot(scale~whole,data=YTFlounder)
plot(scale~cross,data=YTFlounder)
plot(whole~cross,data=YTFlounder)
par(op)




