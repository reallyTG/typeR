library(PMCMR)


### Name: summary.PMCMR
### Title: Summarizing PMCMR objects
### Aliases: summary.PMCMR
### Keywords: methods print

### ** Examples

out <- posthoc.kruskal.conover.test(count ~ spray,
data = InsectSprays, p.adjust="bonf")
summary(out)



