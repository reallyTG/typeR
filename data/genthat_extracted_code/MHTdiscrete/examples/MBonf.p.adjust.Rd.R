library(MHTdiscrete)


### Name: MBonf.p.adjust
### Title: The adjusted p-values for Modified Bonferroni single-step FWER
###   controlling procedure.
### Aliases: MBonf.p.adjust

### ** Examples

p <- c(pbinom(1,8,0.5),pbinom(1,5,0.75),pbinom(1,6,0.6))
p.set <-list(pbinom(0:8,8,0.5),pbinom(0:5,5,0.75),pbinom(0:6,6,0.6))
MBonf.p.adjust(p,p.set)
## Compare with the traditional Bonferroni adjustment
p.adjust(p,method = "bonferroni")
## Compare with the Tarone adjustment
Tarone.p.adjust(p,p.set)



