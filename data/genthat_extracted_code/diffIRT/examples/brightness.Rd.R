library(diffIRT)


### Name: brightness
### Title: A Simulated Response Time Dataset according to an Experimental
###   Design
### Aliases: brightness
### Keywords: datasets

### ** Examples

data(brightness)
x=brightness[,1:12]
rt=brightness[,13:24]

## Not run: 
##D res = diffIRT(rt,x,model="D",constrain=c(rep(1,6),
##D rep(2,6),3:8,3:8,rep(9,12),0,10), start=c(rep(NA,36),0,NA))
## End(Not run)



