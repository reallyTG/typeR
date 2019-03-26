library(mixAK)


### Name: cbplot
### Title: Plot a function together with its confidence/credible bands
### Aliases: cbplot
### Keywords: dplot

### ** Examples

### Artificial credible bands around the CDF's of N(100, 15*15)
### and N(80, 10*10)
iq <- seq(55, 145, length=100)
Fiq <- pnorm(iq, 100, 15)
low <- Fiq - 0.1
upp <- Fiq + 0.1

iq2 <- seq(35, 125, length=100)
Fiq2 <- pnorm(iq, 80, 10)
low2 <- Fiq2 - 0.1
upp2 <- Fiq2 + 0.1

cbplot(iq, Fiq, low, upp, xlim=c(35, 145))
cbplot(iq2, Fiq2, low2, upp2, add=TRUE, col="red4",
       scol=rainbow_hcl(1, start=20, end=20))



