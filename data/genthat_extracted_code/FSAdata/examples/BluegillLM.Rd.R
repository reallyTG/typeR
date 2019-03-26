library(FSAdata)


### Name: BluegillLM
### Title: Lengths and weights for Bluegill from Lake Mary, MN.
### Aliases: BluegillLM
### Keywords: datasets

### ** Examples

data(BluegillLM)
str(BluegillLM)
head(BluegillLM)
op <- par(mfrow=c(3,2),pch=19)
plot(wght~sl,data=BluegillLM)
plot(wght~fl,data=BluegillLM)
plot(wght~tl,data=BluegillLM)
plot(tl~fl,data=BluegillLM)
plot(tl~sl,data=BluegillLM)
plot(fl~sl,data=BluegillLM)
par(op)



