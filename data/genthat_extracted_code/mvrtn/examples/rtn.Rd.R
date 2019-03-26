library(mvrtn)


### Name: rtn
### Title: random variates from truncated normal distribution
### Aliases: rtn
### Keywords: distribution

### ** Examples

#Empirical validation
z<-rtn(10^4, 100, 15, c=120, side="left")
c(mean(z), var(z))
mvtn(100, 15, c=120, side="left")




