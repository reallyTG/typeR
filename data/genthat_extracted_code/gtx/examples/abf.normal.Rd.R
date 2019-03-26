library(gtx)


### Name: abf.normal
### Title: Calculate approximate Bayes factor (ABF) for normal prior.
### Aliases: abf.normal

### ** Examples

data(agtstats)
agtstats$pval <- with(agtstats, pchisq((beta/se.GC)^2, df = 1, lower.tail = FALSE))
max1 <- function(bf) return(bf/max(bf, na.rm = TRUE))
agtstats$BF.normal <- with(agtstats, max1(abf.Wakefield(beta, se.GC, 0.05)))
agtstats$BF.numeric <- with(agtstats, max1(abf.normal(beta, se.GC, 0.05)))
with(agtstats, plot(BF.normal, BF.numeric)) # excellent agreement



