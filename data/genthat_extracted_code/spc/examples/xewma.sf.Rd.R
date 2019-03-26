library(spc)


### Name: xewma.sf
### Title: Compute the survival function of EWMA run length
### Aliases: xewma.sf
### Keywords: ts

### ** Examples

## Gan (1993), two-sided EWMA with fixed control limits
## some values of his Table 1 -- any median RL should be 500

G.lambda <- c(.05, .1, .15, .2, .25)
G.h <- c(.441, .675, .863, 1.027, 1.177)/sqrt(G.lambda/(2-G.lambda))

for ( i in 1:length(G.lambda) ) {
  SF <- xewma.sf(G.lambda[i], G.h[i], 0, 1000)
  if (i==1) plot(1:length(SF), SF, type="l", xlab="n", ylab="P(L>n)")
  else lines(1:length(SF), SF, col=i)
}



