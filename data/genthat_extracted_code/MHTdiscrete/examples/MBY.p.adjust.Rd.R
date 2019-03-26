library(MHTdiscrete)


### Name: MBY.p.adjust
### Title: The adjusted p-values for Modified Benjamini-Yekutieli (BY)
###   step-up FDR controlling procedure.
### Aliases: MBY.p.adjust

### ** Examples

p <- c(pbinom(1,8,0.5),pbinom(1,5,0.75),pbinom(1,6,0.6))
p.set <-list(pbinom(0:8,8,0.5),pbinom(0:5,5,0.75),pbinom(0:6,6,0.6))
MBY.p.adjust(p,p.set)



