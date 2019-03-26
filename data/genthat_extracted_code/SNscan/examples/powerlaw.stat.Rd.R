library(SNscan)


### Name: powerlaw.stat
### Title: Discrete Power-Law Scan Statistic
### Aliases: powerlaw.stat
### Keywords: statistics

### ** Examples

library(poweRlaw)
data(zetatable)
x=rpldis(n=100, xmin=1, alpha=1.5) #function from poweRlaw
powerlaw.stat(obs=x,zloc=1:5,zetatable = zetatable)



