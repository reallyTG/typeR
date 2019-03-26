library(PMCMR)


### Name: jonckheere.test
### Title: Jonckheere-Terpstrata test for testing k independent samples
###   against ordered alternatives
### Aliases: jonckheere.test jonckheere.test.default
### Keywords: htest nonparametric

### ** Examples

##
## Example from Sachs (1997, p. 402)
x <- c(106, 114, 116, 127, 145, 110, 125,
       143, 148, 151, 136, 139, 149, 160,
       174)
g <- as.factor(c(rep(1,5), rep(2,5), rep(3,5)))
levels(g) <- c("A", "B", "C")
jonckheere.test(x , g, "increasing")



