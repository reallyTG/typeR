library(vcdExtra)


### Name: PhdPubs
### Title: Publications of PhD Candidates
### Aliases: PhdPubs
### Keywords: datasets

### ** Examples

data(PhdPubs)
# very uninformative
hist(PhdPubs$articles, breaks=0:19, col="pink", xlim=c(0,20),
     xlab="Number of Articles")

library(vcd)
rootogram(goodfit(PhdPubs$articles), xlab="Number of Articles")
# compare with negative binomial
rootogram(goodfit(PhdPubs$articles, type="nbinomial"), 
	xlab="Number of Articles", main="Negative binomial")





