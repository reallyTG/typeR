library(PMCMR)


### Name: get.pvalues
### Title: Prints PMCMR objects
### Aliases: get.pvalues
### Keywords: utilities

### ** Examples

data(InsectSprays)
attach(InsectSprays)
out <- posthoc.kruskal.dunn.test(count ~ spray, p.adjust="bonf")
out.p <- get.pvalues(out)
out.p

### a barplot, significant level at p < 0.05
require(multcompView)
out.mcV <- multcompLetters(out.p, threshold=0.05)
Rij <- rank(count)
Rj.mean <- tapply(Rij, spray, mean)
ti <- paste(out$method, "\nP-adjustment method:", out$p.adjust.method)
xx <- barplot(Rj.mean, ylim=c(0, 1.2* max(Rj.mean)),
xlab="Spray", ylab="Mean rank", main=ti)
yy <- Rj.mean + 3
text(xx, yy, lab=out.mcV$Letters)

## table format
dat <- data.frame(Group = names(Rj.mean),
                  meanRj = Rj.mean,
                  M = out.mcV$Letters)
dat

## LaTeX table
require(xtable)
xtable(dat, caption=ti, digits=1)

detach(InsectSprays)



