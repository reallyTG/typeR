library(MHTdiscrete)


### Name: GTBH.p.adjust
### Title: The adjusted p-values for Gilbert-Tarone-BH step-up FDR
###   controlling procedure.
### Aliases: GTBH.p.adjust

### ** Examples

p <- c(pbinom(1,8,0.5),pbinom(1,5,0.75),pbinom(1,6,0.6))
p.set <-list(pbinom(0:8,8,0.5),pbinom(0:5,5,0.75),pbinom(0:6,6,0.6))
GTBH.p.adjust(p,p.set)



