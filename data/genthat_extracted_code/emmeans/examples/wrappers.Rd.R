library(emmeans)


### Name: lsmeans
### Title: Wrappers for alternative naming of EMMs
### Aliases: lsmeans wrappers pmmeans lstrends pmtrends lsmip pmmip lsm pmm
###   lsmobj pmmobj lsm.options get.lsm.option

### ** Examples

pigs.lm <- lm(log(conc) ~ source + factor(percent), data = pigs)
lsmeans(pigs.lm, "source")



