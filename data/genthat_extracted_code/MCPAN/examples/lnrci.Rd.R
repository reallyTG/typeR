library(MCPAN)


### Name: lnrci
### Title: Simultaneous confidence intervals for expected values assuming
###   lognormal distribution.
### Aliases: lnrci lndci
### Keywords: htest

### ** Examples


x <- rlnorm(n=100, meanlog=rep(c(0,0.1,1,1), each=25), sdlog=0.5)
f <- as.factor(rep(LETTERS[1:4], each=25))
boxplot(x~f)

lndci(x=x, f=f, type="Dunnett", method="GPQ", B=20000)
lndci(x=x, f=f, type="Dunnett", method="AN")

lnrci(x=x, f=f, type="Tukey", method="GPQ", B=20000)
lnrci(x=x, f=f, type="Tukey", method="AN")



