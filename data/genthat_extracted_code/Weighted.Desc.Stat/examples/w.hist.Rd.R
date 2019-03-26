library(Weighted.Desc.Stat)


### Name: w.hist
### Title: weighted histogram
### Aliases: w.hist
### Keywords: Weighted Descriptive Statistics Weighted Statistics
###   Real-valued Fuzzy Data Weighted Histogram

### ** Examples

n = 5000
x = rnorm(n,17,1)
x[x<14 | x>20] = NA
range(x)
mu = runif(n,0,1)
bre = seq(from=14,to=20,len=18)
cu = seq(from=0,to=1,len=10)
w.hist(x, mu, breaks=bre, cuts=cu, ylim=c(0,n/7), lwd = 2)

## The function is currently defined as
function(x, mu, breaks, cuts, ylim = NULL, freq = NULL, lwd = NULL) 
{
Gray = paste("gray", round(seq(from=10, to=100, len=length(cuts)-1)), sep="")
hist(x, col=Gray[1], xlim=range(breaks), ylim=ylim, breaks=breaks, freq=freq, lwd=lwd)
i=2
while(i<=length(cuts))
{
X=x
X[(X*(mu>=cuts[i]))==0]=NA
hist(X, col=Gray[i], xlim=range(breaks), ylim=ylim, breaks=breaks, freq=freq, lwd=lwd, add=TRUE)
i=i+1
}
}



