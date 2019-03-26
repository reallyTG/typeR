library(MHTdiscrete)


### Name: MixBonf.p.adjust
### Title: The adjusted p-values for Mixed Bonferroni single-step FWER
###   controlling procedure.
### Aliases: MixBonf.p.adjust

### ** Examples

pd <- c(pbinom(1,8,0.5),pbinom(1,5,0.75)); pc <- c(0.04, 0.1)
pd.set <-list(pbinom(0:8,8,0.5),pbinom(0:5,5,0.75))
MixBonf.p.adjust(pc,pd,pd.set)
## Compare with the traditional Bonferroni adjustment
p.adjust(c(pc,pd),method = "bonferroni")



